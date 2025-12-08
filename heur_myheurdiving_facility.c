/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                                                                           */
/*                  This file is part of the program and library             */
/*         SCIP --- Solving Constraint Integer Programs                      */
/*                                                                           */
/*  Copyright (c) 2002-2024 Zuse Institute Berlin (ZIB)                      */
/*                                                                           */
/*  Licensed under the Apache License, Version 2.0 (the "License");          */
/*  you may not use this file except in compliance with the License.         */
/*  You may obtain a copy of the License at                                  */
/*                                                                           */
/*      http://www.apache.org/licenses/LICENSE-2.0                           */
/*                                                                           */
/*  Unless required by applicable law or agreed to in writing, software      */
/*  distributed under the License is distributed on an "AS IS" BASIS,        */
/*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. */
/*  See the License for the specific language governing permissions and      */
/*  limitations under the License.                                           */
/*                                                                           */
/*  You should have received a copy of the Apache-2.0 license                */
/*  along with SCIP; see the file LICENSE. If not visit scipopt.org.         */
/*                                                                           */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/**@file   heur_myheurdiving.c
 * @ingroup DEFPLUGINS_HEUR
 * @brief  自定义 diving 启发式：基于变量特征计算评分（无 Python 依赖）
 * @author Your Name
 */
#include "scip/heur_myheurdiving_facility.h"
#include "scip/heuristics.h"
#include "scip/pub_heur.h"
#include "scip/pub_message.h"
#include "scip/pub_misc.h"
#include "scip/pub_var.h"
#include "scip/pub_lp.h"
#include "scip/scip_heur.h"
#include "scip/scip_lp.h"
#include "scip/scip_mem.h"
#include "scip/scip_numerics.h"
#include "scip/scip_sol.h"
#include "scip/scip_prob.h"
#include "scip/scip_var.h"
#include <string.h>
#include <math.h>

// >>>>>>>>>> 中文注释：已移除 Python.h 和相关宏定义 <<<<<<<<<<
// 不再包含 #include <Python.h> 或 #define PY_SSIZE_T_CLEAN

#define HEUR_NAME             "facility_diving"
#define HEUR_DESC             "Custom diving heuristic based on variable features"
#define HEUR_DISPCHAR         SCIP_HEURDISPCHAR_DIVING
#define HEUR_PRIORITY         -1002000
#define HEUR_FREQ             10
#define HEUR_FREQOFS          2
#define HEUR_MAXDEPTH         -1
#define HEUR_TIMING           SCIP_HEURTIMING_AFTERLPPLUNGE
#define HEUR_USESSUBSCIP      FALSE
#define DIVESET_DIVETYPES     SCIP_DIVETYPE_INTEGRALITY | SCIP_DIVETYPE_SOS1VARIABLE
#define DIVESET_ISPUBLIC      TRUE

/*
 * 默认参数
 */
#define DEFAULT_MINRELDEPTH         0.0
#define DEFAULT_MAXRELDEPTH         1.0
#define DEFAULT_MAXLPITERQUOT      0.05
#define DEFAULT_MAXLPITEROFS       1000
#define DEFAULT_MAXDIVEUBQUOT       0.8
#define DEFAULT_MAXDIVEAVGQUOT      0.0
#define DEFAULT_MAXDIVEUBQUOTNOSOL  0.1
#define DEFAULT_MAXDIVEAVGQUOTNOSOL 0.0
#define DEFAULT_BACKTRACK          TRUE
#define DEFAULT_LPRESOLVEDOMCHGQUOT 0.15
#define DEFAULT_LPSOLVEFREQ           0
#define DEFAULT_ONLYLPBRANCHCANDS FALSE
#define DEFAULT_RANDSEED             103

struct SCIP_HeurData
{
   SCIP_SOL* sol;
};

// >>>>>>>>>> 中文注释：新增纯 C 版本评分函数，完全对应新版 Python 逻辑 <<<<<<<<<<
static
void computeDivingScore(
   SCIP_Bool        mayrounddown,
   SCIP_Bool        mayroundup,
   SCIP_Real        candsfrac,
   SCIP_Real        candsol,
   int              nlocksdown,
   int              nlocksup,
   double           obj,
   double           objnorm,
   SCIP_Real        pscostdown,
   SCIP_Real        pscostup,
   double           rootsolval,
   int              nNonz,
   SCIP_Bool        isBinary,
   SCIP_Real*       score,
   SCIP_Bool*       roundup
)
{
   SCIP_Real s = 0.0;
   SCIP_Bool ru = FALSE;

   /* 基础分：归一化目标系数贡献 */
   if( objnorm > 0.0 )
      s += (obj / (objnorm + 1e-9)) * 5.0;
   // 否则加 0（无需显式处理）

   /* 惩罚可行的舍入方向，以鼓励探索 */
   if( mayrounddown )
      s -= (SCIP_Real)nlocksdown * 7.0;
   if( mayroundup )
      s -= (SCIP_Real)nlocksup * 7.0;

   /* 偏好远离 0.5 的分数部分（鼓励探索边界） */
   s += fabs(candsfrac - 0.5) * 10.0;

   /* 基于当前解值和根节点解的贡献调整分数 */
   if( rootsolval != 0.0 )
   {
      double denom = 1.0 + fabs(rootsolval) * obj;
      if( denom != 0.0 ) // 防止除零（虽然理论上不会为0）
         s += (candsol / denom) * 4.0;
   }

   /* 利用伪成本影响舍入决策 */
   if( pscostdown < 0.0 && mayrounddown )
      s += (-pscostdown) * 3.0;  // 负伪成本 → 更倾向于向下舍入
   if( pscostup < 0.0 && mayroundup )
      s -= (-pscostup) * 3.0;    // 负伪成本 → 不鼓励向上舍入

   /* 根据分数部分和可行性确定舍入方向 */
   if( candsfrac >= 0.7 && mayroundup )
      ru = TRUE;
   else if( candsfrac <= 0.3 && mayrounddown )
      ru = FALSE;
   // 注意：若不在 [0.3, 0.7] 区间外，或不可行，则保持 ru = FALSE（默认）

   /* 鼓励非零项更少的变量 */
   if( nNonz > 0 )
      s += (1.0 / ((SCIP_Real)nNonz + 1.0)) * 2.0;

   *score = s;
   *roundup = ru;
}
// <<<<<<<<<< 中文注释：评分函数结束 <<<<<<<<<<


/*
 * 回调函数
 */

static
SCIP_DECL_HEURCOPY(heurCopyMyheurdiving)
{
   assert(scip != NULL);
   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   SCIP_CALL( SCIPincludeHeurMyheurdiving_facility(scip) );
   return SCIP_OKAY;
}

static
SCIP_DECL_HEURFREE(heurFreeMyheurdiving)
{
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);
   assert(scip != NULL);

   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);
   SCIPfreeBlockMemory(scip, &heurdata);
   SCIPheurSetData(heur, NULL);

   return SCIP_OKAY;
}

static
SCIP_DECL_HEURINIT(heurInitMyheurdiving)
{
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   SCIP_CALL( SCIPcreateSol(scip, &heurdata->sol, heur) );

   return SCIP_OKAY;
}

static
SCIP_DECL_HEUREXIT(heurExitMyheurdiving)
{
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   SCIP_CALL( SCIPfreeSol(scip, &heurdata->sol) );

   return SCIP_OKAY;
}

static
SCIP_DECL_HEUREXEC(heurExecMyheurdiving)
{
   SCIP_HEURDATA* heurdata;
   SCIP_DIVESET* diveset;

   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   assert(SCIPheurGetNDivesets(heur) > 0);
   diveset = SCIPheurGetDivesets(heur)[0];
   assert(diveset != NULL);

   *result = SCIP_DIDNOTFIND;

   if (SCIPgetNBinVars(scip) + SCIPgetNIntVars(scip) == 0)
      return SCIP_OKAY;

   SCIP_CALL( SCIPperformGenericDivingAlgorithm(
      scip,
      diveset,
      heurdata->sol,                 // ← removed & (pass SCIP_SOL*, not SCIP_SOL**)
      heur,
      result,
      FALSE,                         // nodeinfeasible
      -1LL,                          // iterlim: dynamic
      SCIP_DIVECONTEXT_SINGLE        // divecontext
   ) );    
   return SCIP_OKAY;
}

/** 评分回调：使用纯 C 实现的新评分逻辑 */
static
SCIP_DECL_DIVESETGETSCORE(divesetGetScoreMyheurdiving)
{
   SCIP_Bool mayrounddown = SCIPvarMayRoundDown(cand);
   SCIP_Bool mayroundup = SCIPvarMayRoundUp(cand);
   int nlocksdown = SCIPvarGetNLocksDownType(cand, SCIP_LOCKTYPE_MODEL);
   int nlocksup = SCIPvarGetNLocksUpType(cand, SCIP_LOCKTYPE_MODEL);
   double obj = SCIPvarGetObj(cand);
   double objnorm = SCIPgetObjNorm(scip);
   SCIP_Real pscostdown = SCIPgetVarPseudocostVal(scip, cand, 0.0 - candsfrac);
   SCIP_Real pscostup = SCIPgetVarPseudocostVal(scip, cand, 1.0 - candsfrac);
   double rootsolval = SCIPvarGetRootSol(cand);
   int nNonz = SCIPcolGetNNonz(SCIPvarGetCol(cand));
   SCIP_Bool isBinary = SCIPvarIsBinary(cand);

   // >>>>>>>>>> 中文注释：调用新版 C 评分函数，替代原 Python 调用 <<<<<<<<<<
   computeDivingScore(
      mayrounddown, mayroundup, candsfrac, candsol,
      nlocksdown, nlocksup, obj, objnorm,
      pscostdown, pscostup, rootsolval, nNonz, isBinary,
      score, roundup
   );
   // <<<<<<<<<< 中文注释：替换完成 <<<<<<<<<<

   return SCIP_OKAY;
}

/*
 * 插件注册接口（函数名必须与 .h 文件一致）
 */
SCIP_RETCODE SCIPincludeHeurMyheurdiving_facility(SCIP* scip)
{
   SCIP_HEURDATA* heurdata;
   SCIP_HEUR* heur;

   SCIP_CALL( SCIPallocBlockMemory(scip, &heurdata) );

   SCIP_CALL( SCIPincludeHeurBasic(scip, &heur,
         HEUR_NAME, HEUR_DESC, HEUR_DISPCHAR, HEUR_PRIORITY, HEUR_FREQ, HEUR_FREQOFS,
         HEUR_MAXDEPTH, HEUR_TIMING, HEUR_USESSUBSCIP, heurExecMyheurdiving, heurdata) );

   assert(heur != NULL);

   SCIP_CALL( SCIPsetHeurCopy(scip, heur, heurCopyMyheurdiving) );
   SCIP_CALL( SCIPsetHeurFree(scip, heur, heurFreeMyheurdiving) );
   SCIP_CALL( SCIPsetHeurInit(scip, heur, heurInitMyheurdiving) );
   SCIP_CALL( SCIPsetHeurExit(scip, heur, heurExitMyheurdiving) );

   SCIP_CALL( SCIPcreateDiveset(scip, NULL, heur, HEUR_NAME, DEFAULT_MINRELDEPTH, DEFAULT_MAXRELDEPTH, DEFAULT_MAXLPITERQUOT,
         DEFAULT_MAXDIVEUBQUOT, DEFAULT_MAXDIVEAVGQUOT, DEFAULT_MAXDIVEUBQUOTNOSOL, DEFAULT_MAXDIVEAVGQUOTNOSOL, DEFAULT_LPRESOLVEDOMCHGQUOT,
         DEFAULT_LPSOLVEFREQ, DEFAULT_MAXLPITEROFS, DEFAULT_RANDSEED, DEFAULT_BACKTRACK, DEFAULT_ONLYLPBRANCHCANDS,
         DIVESET_ISPUBLIC, DIVESET_DIVETYPES, divesetGetScoreMyheurdiving, NULL) );

   return SCIP_OKAY;
}
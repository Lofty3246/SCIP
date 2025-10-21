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

/**@file   heur_coefdiving.c
 * @ingroup DEFPLUGINS_HEUR
 * @brief  LP diving heuristic that chooses fixings w.r.t. the matrix coefficients
 * @author Tobias Achterberg
 * @author Marc Pfetsch
 *
 * Indicator constraints are taken into account if present.
 */

/*---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0----+----1----+----2*/

#include "scip/heur_myheurdiving.h"
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
#include <Python.h>
#define PY_SSIZE_T_CLEAN

#define HEUR_NAME             "myheurdiving"
#define HEUR_DESC             "LP diving heuristic that chooses fixings w.r.t. the matrix coefficients"
#define HEUR_DISPCHAR         SCIP_HEURDISPCHAR_DIVING
#define HEUR_PRIORITY         -1002000
#define HEUR_FREQ             10
#define HEUR_FREQOFS          2
#define HEUR_MAXDEPTH         -1
#define HEUR_TIMING           SCIP_HEURTIMING_AFTERLPPLUNGE
#define HEUR_USESSUBSCIP      FALSE  /**< does the heuristic use a secondary SCIP instance? */
#define DIVESET_DIVETYPES     SCIP_DIVETYPE_INTEGRALITY | SCIP_DIVETYPE_SOS1VARIABLE /**< bit mask that represents all supported dive types */
#define DIVESET_ISPUBLIC      TRUE  /**< is this dive set publicly available (ie., can be used by other primal heuristics?) */


/*
 * Default parameter settings
 */

#define DEFAULT_MINRELDEPTH         0.0 /**< minimal relative depth to start diving */
#define DEFAULT_MAXRELDEPTH         1.0 /**< maximal relative depth to start diving */
#define DEFAULT_MAXLPITERQUOT      0.05 /**< maximal fraction of diving LP iterations compared to node LP iterations */
#define DEFAULT_MAXLPITEROFS       1000 /**< additional number of allowed LP iterations */
#define DEFAULT_MAXDIVEUBQUOT       0.8 /**< maximal quotient (curlowerbound - lowerbound)/(cutoffbound - lowerbound)
                                         *   where diving is performed (0.0: no limit) */
#define DEFAULT_MAXDIVEAVGQUOT      0.0 /**< maximal quotient (curlowerbound - lowerbound)/(avglowerbound - lowerbound)
                                         *   where diving is performed (0.0: no limit) */
#define DEFAULT_MAXDIVEUBQUOTNOSOL  0.1 /**< maximal UBQUOT when no solution was found yet (0.0: no limit) */
#define DEFAULT_MAXDIVEAVGQUOTNOSOL 0.0 /**< maximal AVGQUOT when no solution was found yet (0.0: no limit) */
#define DEFAULT_BACKTRACK          TRUE /**< use one level of backtracking if infeasibility is encountered? */
#define DEFAULT_LPRESOLVEDOMCHGQUOT 0.15 /**< percentage of immediate domain changes during probing to trigger LP resolve */
#define DEFAULT_LPSOLVEFREQ           0 /**< LP solve frequency for diving heuristics */
#define DEFAULT_ONLYLPBRANCHCANDS FALSE /**< should only LP branching candidates be considered instead of the slower but
                                         *   more general constraint handler diving variable selection? */
#define DEFAULT_RANDSEED             103 /**< default random seed */

/* locally defined heuristic data */
struct SCIP_HeurData
{
   SCIP_SOL*             sol;                /**< working solution */
};

/*
 * local methods
 */

/*
 * Callback methods
 */

/** copy method for primal heuristic plugins (called when SCIP copies plugins) */
static
SCIP_DECL_HEURCOPY(heurCopyMyheurdiving)
{  /*lint --e{715}*/
   assert(scip != NULL);
   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   /* call inclusion method of constraint handler */
   SCIP_CALL( SCIPincludeHeurMyheurdiving(scip) );

   return SCIP_OKAY;
}

/** destructor of primal heuristic to free user data (called when SCIP is exiting) */
static
SCIP_DECL_HEURFREE(heurFreeMyheurdiving) /*lint --e{715}*/
{  /*lint --e{715}*/
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);
   assert(scip != NULL);

   /* free heuristic data */
   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);
   SCIPfreeBlockMemory(scip, &heurdata);
   SCIPheurSetData(heur, NULL);

   return SCIP_OKAY;
}


/** initialization method of primal heuristic (called after problem was transformed) */
static
SCIP_DECL_HEURINIT(heurInitMyheurdiving) /*lint --e{715}*/
{  /*lint --e{715}*/
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   /* get heuristic data */
   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   /* create working solution */
   SCIP_CALL( SCIPcreateSol(scip, &heurdata->sol, heur) );

   return SCIP_OKAY;
}


/** deinitialization method of primal heuristic (called before transformed problem is freed) */
static
SCIP_DECL_HEUREXIT(heurExitMyheurdiving) /*lint --e{715}*/
{  /*lint --e{715}*/
   SCIP_HEURDATA* heurdata;

   assert(heur != NULL);
   assert(strcmp(SCIPheurGetName(heur), HEUR_NAME) == 0);

   /* get heuristic data */
   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   /* free working solution */
   SCIP_CALL( SCIPfreeSol(scip, &heurdata->sol) );

   return SCIP_OKAY;
}


/** execution method of primal heuristic */
static
SCIP_DECL_HEUREXEC(heurExecMyheurdiving) /*lint --e{715}*/
{  /*lint --e{715}*/
   SCIP_HEURDATA* heurdata;
   SCIP_DIVESET* diveset;

   heurdata = SCIPheurGetData(heur);
   assert(heurdata != NULL);

   assert(SCIPheurGetNDivesets(heur) > 0);
   assert(SCIPheurGetDivesets(heur) != NULL);
   diveset = SCIPheurGetDivesets(heur)[0];
   assert(diveset != NULL);

   *result = SCIP_DIDNOTFIND;

    if (SCIPgetNBinVars(scip) + SCIPgetNIntVars(scip) == 0)
    {
        return SCIP_OKAY;
    }

   SCIP_CALL( SCIPperformGenericDivingAlgorithm(scip, diveset, heurdata->sol, heur, result, nodeinfeasible, -1L, -1, -1.0, SCIP_DIVECONTEXT_SINGLE) );

   return SCIP_OKAY;
}

/** returns a score for the given candidate -- the best candidate maximizes the diving score */
static
SCIP_DECL_DIVESETGETSCORE(divesetGetScoreMyheurdiving)
{
   SCIP_Bool mayrounddown = SCIPvarMayRoundDown(cand);
   SCIP_Bool mayroundup = SCIPvarMayRoundUp(cand);
   int nlocksdown = SCIPvarGetNLocksDownType(cand, SCIP_LOCKTYPE_MODEL);
   int nlocksup = SCIPvarGetNLocksUpType(cand, SCIP_LOCKTYPE_MODEL);
   double obj = SCIPvarGetObj(cand);
   double objnorm = SCIPvarGetObjNorm(scip);
   SCIP_Real pscostdown = SCIPgetVarPseudocostVal(scip, cand, 0.0 - candsfrac);
   SCIP_Real pscostup = SCIPgetVarPseudocostVal(scip, cand, 1.0 - candsfrac);
   double rootsolval = SCIPvarGetRootSol(cand);
   int nNonz = SCIPcolGetNNz(SCIPvarGetCol(cand));
   SCIP_Bool isBinary = SCIPvarIsBinary(cand);

   
   if (Py_IsInitialized())
   {
   }
   else
   {
      Py_Initialize();
   }

   PyObject *pName, *pModule, *pFunc;
   PyObject *pArgs, *pValue;
   PyRun_simpleString("import sys");
   PyRun_SimpleString("sys.path.append('.')"); // Current directory
   char name[128] = "func_helper";
   char moduleName[128] = "myheurdiving_helper";
   pName = PyUnicode_DecodeFSDefault(name);
   pModule = PyImport_ImportModule(pName);

   Py_DECREF(pName);
   if (pModule != NULL)
   {
      pFunc = PyObject_GetAttrString(pModule, moduleName);
      if (pFunc && PyCallable_Check(pFunc))
      {
         pArgs = PyTuple_New(13);
         pValue = PyLong_FromUnsignedLong(mayrounddown);
         PyTuple_SetItem(pArgs, 0, pValue);
         pValue = PyLong_FromUnsignedLong(mayroundup);
         PyTuple_SetItem(pArgs, 1, pValue);
         pValue = PyFloat_FromDouble(candsfrac);
         PyTuple_SetItem(pArgs, 2, pValue);
         pValue = PyFloat_FromDouble(candsol);
         PyTuple_SetItem(pArgs, 3, pValue);
         pValue = PyLong_FromLong(nlocksdown);
         PyTuple_SetItem(pArgs, 4, pValue);
         pValue = PyLong_FromLong(nlocksup);
         PyTuple_SetItem(pArgs, 5, pValue);
         pValue = PyFloat_FromDouble(obj);
         PyTuple_SetItem(pArgs, 6, pValue);
         pValue = PyFloat_FromDouble(objnorm);
         PyTuple_SetItem(pArgs, 7, pValue);
         pValue = PyFloat_FromDouble(pscostdown);
         PyTuple_SetItem(pArgs, 8, pValue);
         pValue = PyFloat_FromDouble(pscostup);
         PyTuple_SetItem(pArgs, 9, pValue);
         pValue = PyFloat_FromDouble(rootsolval);
         PyTuple_SetItem(pArgs, 10, pValue);
         pValue = PyLong_FromLong(nNonz);
         PyTuple_SetItem(pArgs, 11, pValue);
         pValue = PyLong_FromUnsignedLong(isBinary);
         PyTuple_SetItem(pArgs, 12, pValue);

         pValue = PyObject_CallObject(pFunc, pArgs);
         Py_DECREF(pArgs);

         if (pValue != NULL)
         {
            PyObject *pScore = PyTuple_GetItem(pValue, 0);
            PyObject *pRoundup = PyTuple_GetItem(pValue, 1);
            if (pScore && pRoundup)
            {
               double pscore = PyFloat_AsDouble(pScore);
               unsigned int proundup = PyLong_AsUnsignedLong(pRoundup);
               if (proundup == 0 || proundup == 1)
               {
                  *roundup = proundup;
                  *score = pscore;
               }}
               else
               {
                  PyErr_Print();
                  fprint(stderr, "Python function returned invalid roundup value\n");
               }
               Py_DECREF(pValue);
            }
            else
            {
               Py_DECREF(pFunc);
               Py_DECREF(pModule);
               PyErr_Print();
               SCIPerrorMessage("Python function call failed\n");
               assert(0);
               return 1;
            }
         }
         else
         {
            if (PyErr_Occurred())
               PyErr_Print();
         }
         Py_XDECREF(pFunc);
         Py_DECREF(pModule);
        
   }else{
         PyErr_Print();
         fprint(stderr, "Failed to load \n");
         assert(0);
         return 1;
      }

   return SCIP_OKAY;
}

/*
 * heuristic specific interface methods
 */

#define divesetAvailableMyheurdiving NULL

/** creates the coefdiving heuristic and includes it in SCIP */
SCIP_RETCODE SCIPincludeHeurMyheurdiving(
   SCIP*                 scip                /**< SCIP data structure */
   )
{
   SCIP_HEURDATA* heurdata;
   SCIP_HEUR* heur;

   /* create coefdiving primal heuristic data */
   SCIP_CALL( SCIPallocBlockMemory(scip, &heurdata) );

   /* include primal heuristic */
   SCIP_CALL( SCIPincludeHeurBasic(scip, &heur,
         HEUR_NAME, HEUR_DESC, HEUR_DISPCHAR, HEUR_PRIORITY, HEUR_FREQ, HEUR_FREQOFS,
         HEUR_MAXDEPTH, HEUR_TIMING, HEUR_USESSUBSCIP, heurExecMyheurdiving, heurdata) );

   assert(heur != NULL);

   /* set non-NULL pointers to callback methods */
   SCIP_CALL( SCIPsetHeurCopy(scip, heur, heurCopyMyheurdiving) );
   SCIP_CALL( SCIPsetHeurFree(scip, heur, heurFreeMyheurdiving) );
   SCIP_CALL( SCIPsetHeurInit(scip, heur, heurInitMyheurdiving) );
   SCIP_CALL( SCIPsetHeurExit(scip, heur, heurExitMyheurdiving) );

   /* create a diveset (this will automatically install some additional parameters for the heuristic)*/
   SCIP_CALL( SCIPcreateDiveset(scip, NULL, heur, HEUR_NAME, DEFAULT_MINRELDEPTH, DEFAULT_MAXRELDEPTH, DEFAULT_MAXLPITERQUOT,
         DEFAULT_MAXDIVEUBQUOT, DEFAULT_MAXDIVEAVGQUOT, DEFAULT_MAXDIVEUBQUOTNOSOL, DEFAULT_MAXDIVEAVGQUOTNOSOL, DEFAULT_LPRESOLVEDOMCHGQUOT,
         DEFAULT_LPSOLVEFREQ, DEFAULT_MAXLPITEROFS, DEFAULT_RANDSEED, DEFAULT_BACKTRACK, DEFAULT_ONLYLPBRANCHCANDS,
         DIVESET_ISPUBLIC, DIVESET_DIVETYPES, divesetGetScoreMyheurdiving, divesetAvailableMyheurdiving) );

   return SCIP_OKAY;
}


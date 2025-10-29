#ifndef __SCIP_HEUR_MYHEURDIVING_H__
#define __SCIP_HEUR_MYHEURDIVING_H__

#include "scip/def.h"
#include "scip/type_retcode.h"
#include "scip/type_scip.h"

#ifdef __cplusplus
extern "C" {
#endif

/** creates the coefdiving heuristic and includes it in SCIP
 *
 *  @ingroup PrimalHeuristicIncludes
 */
SCIP_EXPORT
SCIP_RETCODE SCIPincludeHeurMyheurdiving(
   SCIP*                 scip                /**< SCIP data structure */
   );

#ifdef __cplusplus
}
#endif

#endif
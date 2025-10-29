# Install script for directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gcg" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_empty.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_bpstrong.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_generic.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_orig.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_relpsprob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/branch_ryanfoster.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_conspartition.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_indexpartition.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/miscvisualization.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_pricingcontroller.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_pricingtype.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_partialdecomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_detprobdata.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_stabilization.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/class_varpartition.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/clscons.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/clsvar.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/colpool.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/cons_decomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/cons_decomp.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/cons_integralorig.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/cons_masterbranch.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/cons_origbranch.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_compgreedily.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_connected_noNewLinkingVars.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_connectedbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_consclass.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_constype.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_dbscan.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_densemasterconss.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_generalmastersetcover.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_generalmastersetpack.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_generalmastersetpart.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_mastersetcover.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_mastersetpack.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_mastersetpart.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_mst.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_neighborhoodmaster.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_postprocess.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_staircase_lsp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_stairheur.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_varclass.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/decomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dialog_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dialog_graph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dialog_master.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/disp_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/disp_master.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/event_bestsol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/event_display.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/event_mastersol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/event_relaxsol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/event_solvingstats.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcgcol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcg_general.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcggithash.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcgplugins.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcgpqueue.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/gcgsort.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgcoefdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgdins.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgfeaspump.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgfracdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgguideddiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcglinesdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgpscostdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgrens.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgrins.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgrounding.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgshifting.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgsimplerounding.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgveclendiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_gcgzirounding.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_greedycolsel.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_mastercoefdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_masterdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_masterfracdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_masterlinesdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_mastervecldiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_origdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_relaxcolsel.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_restmaster.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_setcover.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_xpcrossover.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/heur_xprins.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/masterplugins.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/nodesel_master.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/objdialog.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/objpricer_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/params_visu.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/presol_roundbound.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pricer_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pricestore_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pricingjob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pricingprob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_clscons.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_clsvar.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_colpool.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_decomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_gcgcol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_gcgheur.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_gcgsepa.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_gcgpqueue.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_gcgvar.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_pricingjob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_pricingprob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_score.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/pub_solver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_blk.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_cls.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_dec.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_gp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_ref.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/reader_tex.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/relax_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/scip_misc.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_bender.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_border.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_classic.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_fawh.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_forswh.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_maxwhite.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_spfawh.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_spfwh.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score_strong.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/score.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/sepa_basis.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/sepa_master.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/solver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/solver_cliquer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/solver_knapsack.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/solver_mip.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/solver_xyz.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/stat.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_branchgcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_colpool.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_decomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_detector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_gcgcol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_gcgpqueue.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_pricestore_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_pricingjob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_pricingprob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_score.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_solver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/struct_vardata.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_branchgcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_classifier.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_colpool.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_consclassifier.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_decomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_detector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_gcgcol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_gcgpqueue.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_masterdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_origdiving.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_parameter.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_pricestore_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_pricingjob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_pricingprob.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_pricingstatus.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_score.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_solver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/type_varclassifier.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/wrapper_partialdecomp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/symmetry/automorphism.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/symmetry/automorphism.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/symmetry/pub_automorphism.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/gcg/dec_isomorph.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/graph" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/bipartitegraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/bipartitegraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/bridge.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/columngraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/columngraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graph_gcg.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graph_interface.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graph_tclique.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graphalgorithms.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/graphalgorithms_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hypercolgraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hypercolgraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hypergraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hypergraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hyperrowcolgraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hyperrowcolgraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hyperrowgraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/hyperrowgraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/matrixgraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/matrixgraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/rowgraph.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/rowgraph_def.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src/graph/weights.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg"
         RPATH "/usr/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/gcg")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg"
         OLD_RPATH "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/lib:"
         NEW_RPATH "/usr/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gcg")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgcg.so.3.7.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgcg.so.3.7"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/lib/libgcg.so.3.7.0.0"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/lib/libgcg.so.3.7"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgcg.so.3.7.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgcg.so.3.7"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/lib/libgcg.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg/gcg-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg/gcg-targets.cmake"
         "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/gcg/src/CMakeFiles/Export/55a8c2330c2af6b35ecce0f90032ca65/gcg-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg/gcg-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg/gcg-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg" TYPE FILE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/gcg/src/CMakeFiles/Export/55a8c2330c2af6b35ecce0f90032ca65/gcg-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg" TYPE FILE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/gcg/src/CMakeFiles/Export/55a8c2330c2af6b35ecce0f90032ca65/gcg-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/gcg" TYPE FILE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/gcg/CMakeFiles/gcg-config.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/gcg/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()

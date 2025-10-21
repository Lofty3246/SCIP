if(NOT TARGET libgcg)
  include("${CMAKE_CURRENT_LIST_DIR}/gcg-targets.cmake")
endif()

if(0)
   set(SCIP_DIR "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/scip")
   find_package(SCIP QUIET CONFIG)
endif()

set(GCG_LIBRARIES libgcg)
set(GCG_INCLUDE_DIRS "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/gcg/src")
set(GCG_FOUND TRUE)

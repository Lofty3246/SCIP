# CMake generated Testfile for 
# Source directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check
# Build directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/scip/examples/VRP/check
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(examples-vrp-build "/home/lsy/Downloads/cmake-4.0.4-linux-x86_64/bin/cmake" "--build" "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build" "--config" "Release" "--target" "vrp")
set_tests_properties(examples-vrp-build PROPERTIES  RESOURCE_LOCK "libscip" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;18;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;0;")
add_test(examples-vrp-eil13 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/bin/examples/vrp" "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/../data/eil13.vrp")
set_tests_properties(examples-vrp-eil13 PROPERTIES  DEPENDS "examples-vrp-build" RESOURCE_LOCK "libscip" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;38;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;0;")
add_test(examples-vrp-eil7 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/bin/examples/vrp" "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/../data/eil7.vrp")
set_tests_properties(examples-vrp-eil7 PROPERTIES  DEPENDS "examples-vrp-build" RESOURCE_LOCK "libscip" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;38;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip/examples/VRP/check/CMakeLists.txt;0;")

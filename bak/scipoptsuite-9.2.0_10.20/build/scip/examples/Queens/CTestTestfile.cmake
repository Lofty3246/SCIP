# CMake generated Testfile for 
# Source directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens
# Build directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/scip/examples/Queens
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(examples-queens-build "/home/lsy/Downloads/cmake-4.0.4-linux-x86_64/bin/cmake" "--build" "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build" "--config" "Release" "--target" "queens")
set_tests_properties(examples-queens-build PROPERTIES  RESOURCE_LOCK "libscip" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;28;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")
add_test(examples-queens-1 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/examples/queens" "1")
set_tests_properties(examples-queens-1 PROPERTIES  DEPENDS "examples-queens-build" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;52;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")
add_test(examples-queens-2 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/examples/queens" "2")
set_tests_properties(examples-queens-2 PROPERTIES  DEPENDS "examples-queens-build" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;52;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")
add_test(examples-queens-4 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/examples/queens" "4")
set_tests_properties(examples-queens-4 PROPERTIES  DEPENDS "examples-queens-build" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;52;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")
add_test(examples-queens-8 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/examples/queens" "8")
set_tests_properties(examples-queens-8 PROPERTIES  DEPENDS "examples-queens-build" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;52;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")
add_test(examples-queens-16 "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/build/bin/examples/queens" "16")
set_tests_properties(examples-queens-16 PROPERTIES  DEPENDS "examples-queens-build" _BACKTRACE_TRIPLES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;52;add_test;/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip/examples/Queens/CMakeLists.txt;0;")

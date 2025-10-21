# Install script for directory: /home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/array.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/basevectors.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/changesoplex.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/classarray.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/classset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/clufactor.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/clufactor.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/clufactor_rational.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/clufactor_rational.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/cring.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/dataarray.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/datahashtable.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/datakey.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/dataset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/didxset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/dsvector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/dsvectorbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/dvector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/enter.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/exceptions.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/fmt.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/idlist.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/idxset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/islist.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/leave.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lpcol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lpcolbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lpcolset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lpcolsetbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lprow.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lprowbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lprowset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/lprowsetbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/mpsinput.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/nameset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/notimer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/random.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/rational.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/ratrecon.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/ratrecon.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slinsolver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slinsolver_rational.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slufactor.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slufactor.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slufactor_rational.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/slufactor_rational.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/sol.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/solbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/solverational.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/solvereal.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/sorter.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxalloc.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxautopr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxautopr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxbasis.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxbasis.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxboundflippingrt.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxboundflippingrt.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxbounds.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxchangebasis.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdantzigpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdantzigpr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdefaultrt.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdefaultrt.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdefines.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdefines.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdesc.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdevexpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxdevexpr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxequilisc.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxequilisc.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxfastrt.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxfastrt.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxfileio.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxfileio.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxgeometsc.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxgeometsc.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxgithash.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxharrisrt.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxharrisrt.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxhybridpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxhybridpr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxid.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxleastsqsc.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxleastsqsc.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxlp.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxlpbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxlpbase_rational.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxlpbase_real.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxmainsm.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxmainsm.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxout.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxpapilo.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxparmultpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxparmultpr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxpricer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxquality.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxratiotester.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxscaler.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxscaler.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxshift.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsimplifier.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsolve.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsolver.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsolver.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxstarter.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxstarter.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsteepexpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsteeppr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsteeppr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsumst.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxsumst.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxvecs.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxvectorst.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxvectorst.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxweightpr.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxweightpr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxweightst.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxweightst.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/spxwritestate.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/ssvector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/ssvectorbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/stablesum.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/statistics.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/statistics.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/svector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/svectorbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/svset.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/svsetbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/testsoplex.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/timer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/timerfactory.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/unitvector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/unitvectorbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/updatevector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/updatevector.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/usertimer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/validation.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/validation.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/vector.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/vectorbase.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/wallclocktimer.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex_interface.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/soplex/config.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex_interface.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex/external/fmt" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/chrono.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/color.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/compile.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/core.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/format-inl.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/format.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/locale.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/os.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/ostream.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/posix.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/printf.h"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/fmt/ranges.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex/external/zstr" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/zstr/zstr.hpp"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/soplex/src/soplex/external/zstr/strict_fstream.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex"
         RPATH "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/bin/soplex")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex"
         OLD_RPATH ":::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/lib/libsoplex.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/lib/libsoplex-pic.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/lib/libsoplexshared.so.7.1.2.0"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/lib/libsoplexshared.so.7.1"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/lib/libsoplexshared.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake"
         "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/CMakeFiles/soplex-config.cmake"
    "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex-config-version.cmake"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/build/soplex/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()

# cmake version to be used
cmake_minimum_required(VERSION 3.12)

# project name
project(dledger
        VERSION 0.1
        DESCRIPTION "A distributed ledger based on NDN")

# flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")
set(CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")

# dependencies
find_package(PkgConfig REQUIRED)
pkg_check_modules(NDN_CXX REQUIRED libndn-cxx)
find_package(leveldb REQUIRED)

# files
set(DLEDGER_LIB_SOURCE_FILES
    ./src/backend.hpp
    ./src/backend.cpp
    ./src/ledger-impl.hpp
    ./src/ledger-impl.cpp
    ./src/record.cpp
    ./src/config.cpp
    ./src/record_name.cpp
    ./src/record_name.hpp
    ./src/default-cert-manager.cpp
    ./src/default-cert-manager.h)
# include
include_directories(${NDN_CXX_INCLUDE_DIRS})

# link
link_directories(${NDN_CXX_LIBRARY_DIRS})

# target

add_library(dledger SHARED "")
target_sources(dledger PRIVATE ${DLEDGER_LIB_SOURCE_FILES})
target_include_directories(dledger PUBLIC ./include)
target_include_directories(dledger PRIVATE ./src)
target_compile_options(dledger PUBLIC ${NDN_CXX_CFLAGS})
target_link_libraries(dledger PUBLIC ${NDN_CXX_LIBRARIES} leveldb)

add_executable(backend-test ./test/backend-test.cpp)
target_include_directories(backend-test PRIVATE ./src)
target_link_libraries(backend-test PUBLIC dledger)

add_executable(record-test ./test/record-test.cpp)
target_link_libraries(record-test PUBLIC dledger)

add_executable(ledger-impl-test ./test/ledger-impl-test.cpp)
target_link_libraries(ledger-impl-test PUBLIC dledger)

add_executable(ledger-impl-test-anchor ./test/ledger-impl-test-anchor.cpp)
target_link_libraries(ledger-impl-test-anchor PUBLIC dledger)

if (BUILD_DIGRAPH)
    add_executable(ledger-impl-test-graph ./test/ledger-impl-test-graph.cpp)
    target_link_libraries(ledger-impl-test-graph PUBLIC dledger)
endif (BUILD_DIGRAPH)

if (BUILD_DFI)
    add_subdirectory(dfi-app)
endif(BUILD_DFI)

#configure
set(PKG_CONFIG_REQUIRES
        "libndn-cxx >= ${NDN_CXX_VERSION}"
        )
set(PKG_CONFIG_LIBS
        "-L\${libdir} -l${PROJECT_NAME}"
        )
set(PKG_CONFIG_CFLAGS
        "-I\${includedir}"
        )
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake-pkgconfig.pc.in"
        "${CMAKE_CURRENT_BINARY_DIR}/lib${PROJECT_NAME}.pc")

include(GNUInstallDirs)
install(TARGETS dledger
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )
install(DIRECTORY include/dledger DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING PATTERN "*.h*")

install(TARGETS ledger-impl-test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(TARGETS ledger-impl-test-anchor
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/lib${PROJECT_NAME}.pc"
        DESTINATION lib/pkgconfig)

if (BUILD_DIGRAPH)
    install(TARGETS ledger-impl-test-graph
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
endif (BUILD_DIGRAPH)
# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.14.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.14.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ZhangZhiyi/Develop/dledger-app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ZhangZhiyi/Develop/dledger-app/build

# Include any dependencies generated for this target.
include CMakeFiles/backend-test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/backend-test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/backend-test.dir/flags.make

CMakeFiles/backend-test.dir/test/backend-test.cpp.o: CMakeFiles/backend-test.dir/flags.make
CMakeFiles/backend-test.dir/test/backend-test.cpp.o: ../test/backend-test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ZhangZhiyi/Develop/dledger-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/backend-test.dir/test/backend-test.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/backend-test.dir/test/backend-test.cpp.o -c /Users/ZhangZhiyi/Develop/dledger-app/test/backend-test.cpp

CMakeFiles/backend-test.dir/test/backend-test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/backend-test.dir/test/backend-test.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ZhangZhiyi/Develop/dledger-app/test/backend-test.cpp > CMakeFiles/backend-test.dir/test/backend-test.cpp.i

CMakeFiles/backend-test.dir/test/backend-test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/backend-test.dir/test/backend-test.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ZhangZhiyi/Develop/dledger-app/test/backend-test.cpp -o CMakeFiles/backend-test.dir/test/backend-test.cpp.s

CMakeFiles/backend-test.dir/src/backend.cpp.o: CMakeFiles/backend-test.dir/flags.make
CMakeFiles/backend-test.dir/src/backend.cpp.o: ../src/backend.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ZhangZhiyi/Develop/dledger-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/backend-test.dir/src/backend.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/backend-test.dir/src/backend.cpp.o -c /Users/ZhangZhiyi/Develop/dledger-app/src/backend.cpp

CMakeFiles/backend-test.dir/src/backend.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/backend-test.dir/src/backend.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ZhangZhiyi/Develop/dledger-app/src/backend.cpp > CMakeFiles/backend-test.dir/src/backend.cpp.i

CMakeFiles/backend-test.dir/src/backend.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/backend-test.dir/src/backend.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ZhangZhiyi/Develop/dledger-app/src/backend.cpp -o CMakeFiles/backend-test.dir/src/backend.cpp.s

CMakeFiles/backend-test.dir/src/ledger-record.cpp.o: CMakeFiles/backend-test.dir/flags.make
CMakeFiles/backend-test.dir/src/ledger-record.cpp.o: ../src/ledger-record.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ZhangZhiyi/Develop/dledger-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/backend-test.dir/src/ledger-record.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/backend-test.dir/src/ledger-record.cpp.o -c /Users/ZhangZhiyi/Develop/dledger-app/src/ledger-record.cpp

CMakeFiles/backend-test.dir/src/ledger-record.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/backend-test.dir/src/ledger-record.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ZhangZhiyi/Develop/dledger-app/src/ledger-record.cpp > CMakeFiles/backend-test.dir/src/ledger-record.cpp.i

CMakeFiles/backend-test.dir/src/ledger-record.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/backend-test.dir/src/ledger-record.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ZhangZhiyi/Develop/dledger-app/src/ledger-record.cpp -o CMakeFiles/backend-test.dir/src/ledger-record.cpp.s

# Object files for target backend-test
backend__test_OBJECTS = \
"CMakeFiles/backend-test.dir/test/backend-test.cpp.o" \
"CMakeFiles/backend-test.dir/src/backend.cpp.o" \
"CMakeFiles/backend-test.dir/src/ledger-record.cpp.o"

# External object files for target backend-test
backend__test_EXTERNAL_OBJECTS =

backend-test: CMakeFiles/backend-test.dir/test/backend-test.cpp.o
backend-test: CMakeFiles/backend-test.dir/src/backend.cpp.o
backend-test: CMakeFiles/backend-test.dir/src/ledger-record.cpp.o
backend-test: CMakeFiles/backend-test.dir/build.make
backend-test: CMakeFiles/backend-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ZhangZhiyi/Develop/dledger-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable backend-test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/backend-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/backend-test.dir/build: backend-test

.PHONY : CMakeFiles/backend-test.dir/build

CMakeFiles/backend-test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/backend-test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/backend-test.dir/clean

CMakeFiles/backend-test.dir/depend:
	cd /Users/ZhangZhiyi/Develop/dledger-app/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ZhangZhiyi/Develop/dledger-app /Users/ZhangZhiyi/Develop/dledger-app /Users/ZhangZhiyi/Develop/dledger-app/build /Users/ZhangZhiyi/Develop/dledger-app/build /Users/ZhangZhiyi/Develop/dledger-app/build/CMakeFiles/backend-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/backend-test.dir/depend


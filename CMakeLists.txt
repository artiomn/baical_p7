cmake_minimum_required(VERSION 2.8)

project(baical_p7)

option(BAICAL_P7_BUILD_TESTS ON)
option(BAICAL_P7_BUILD_EXAMPLES ON)

add_subdirectory(Sources)

if (BAICAL_P7_BUILD_TESTS)
	add_subdirectory(Tests/Speed)
	add_subdirectory(Tests/Trace)
endif()

if (BAICAL_P7_BUILD_EXAMPLES)
	add_subdirectory(Examples/C)
	add_subdirectory(Examples/Cpp)
endif()

# Artiom N.(cl)2017

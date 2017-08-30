cmake_minimum_required(VERSION 2.8)
project(P7_Speed_Cpp)

if (WIN32)
  set(platform_include_dir ../../Shared/Platforms/Windows_x86)
else()
  set(platform_include_dir ../../Shared/Platforms/Linux_x86)
endif()

file(GLOB headers ../../Headers/*.h ../../Shared/*.h ${platform_include_dir}/*.h)
include_directories(AFTER SYSTEM ../../Shared ../../Headers ${platform_include_dir})

add_executable (P7_Speed_Test Speed.cpp)
target_link_libraries (P7_Speed_Test P7 pthread dl rt)

# Artiom N.(cl)2017

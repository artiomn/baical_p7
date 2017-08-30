cmake_minimum_required(VERSION 2.8)
project(P7_C_Example)

if (WIN32)
  set(platform_include_dir ../../Shared/Platforms/Windows_x86)
else()
  set(platform_include_dir ../../Shared/Platforms/Linux_x86)
endif()

file(GLOB headers ../../Headers/*.h ../../Shared/*.h ${platform_include_dir}/*.h)
include_directories(AFTER SYSTEM ../../Shared ../../Headers ${platform_include_dir})

add_executable (C_Example C_Example.c)
target_link_libraries (C_Example P7 pthread dl rt)


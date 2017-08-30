cmake_minimum_required(VERSION 2.8)

project(P7)

if (WIN32)
  set(platform_include_dir ../Shared/Platforms/Windows_x86)
else()
  set(platform_include_dir ../Shared/Platforms/Linux_x86)
endif()

file(GLOB headers ../Headers/*.h ../Shared/*.h ${platform_include_dir}/*.h)
file(GLOB src *.cpp *.h)

include_directories(AFTER SYSTEM include ../Shared ../Headers ${platform_include_dir})
add_library(${PROJECT_NAME} SHARED ${headers} ${src})
add_library(${PROJECT_NAME}_static STATIC ${headers} ${src})

target_link_libraries(${PROJECT_NAME} dl rt pthread)

# Artiom N.(cl)2017

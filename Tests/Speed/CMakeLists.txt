cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(p7_speed_test)

if(WIN32)
elseif(UNIX)
else()
    message(FATAL_ERROR "${PROJECT_NAME}: Platform not supported")
endif()

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} PROJ_SOURCES)
add_executable(${PROJECT_NAME} ${PROJ_SOURCES})
target_link_libraries (${PROJECT_NAME} p7)    

set_ide_folder(${PROJECT_NAME})

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
 



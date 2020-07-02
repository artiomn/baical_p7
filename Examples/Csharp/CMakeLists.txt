if(WIN32)
    cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

    project(p7_example_csharp LANGUAGES CSharp)

    include(CSharpUtilities)

    set(CMAKE_CSharp_FLAGS "/langversion:latest")
   
    add_executable(${PROJECT_NAME} 
                   "${CMAKE_CURRENT_SOURCE_DIR}/../../Wrappers/C#/P7.cs"
                   "${CMAKE_CURRENT_SOURCE_DIR}/Program.cs"
                   "${CMAKE_CURRENT_SOURCE_DIR}/Properties/AssemblyInfo.cs"
                   #"${CMAKE_CURRENT_SOURCE_DIR}/Properties/Settings.settings"
                   "${CMAKE_CURRENT_SOURCE_DIR}/Properties/Settings.Designer.cs"
                  )


    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        # 64 bits
        set_property(TARGET ${PROJECT_NAME} PROPERTY VS_GLOBAL_Prefer32Bit "false")
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        # 32 bits
    endif()

    set_property(TARGET ${PROJECT_NAME} PROPERTY VS_DOTNET_TARGET_FRAMEWORK_VERSION "v4.6.1")
    set_property(TARGET ${PROJECT_NAME} PROPERTY WIN32_EXECUTABLE TRUE)
    
    set_property(TARGET ${PROJECT_NAME} PROPERTY VS_DOTNET_REFERENCES
                 "System"
                 "System.Core"
                 "System.Xml.Linq"
                 "System.Data.DataSetExtensions"
                 "Microsoft.CSharp"
                 "System.Data"
                 "System.Xml"
                 )    
    
    set_ide_folder("${PROJECT_NAME}")

    #install(TARGETS "${PROJECT_NAME}" RUNTIME DESTINATION bin)
endif()


 



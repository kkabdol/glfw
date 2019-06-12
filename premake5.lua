project "glfw"
    kind "StaticLib"
    language "C"
    cdialect "C11"
    staticruntime "on"
        
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    debugdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/glfw/glfw3.h",
        "include/glfw/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    filter "system:windows"
        systemversion "latest"

        files                       
        {
            "src/win32_platform.h",
            "src/win32_joystick.h",
            "src/wgl_context.h",
            "src/egl_context.h",
            "src/osmesa_context.h",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

        filter { "system:windows", "configurations:Debug" }
            runtime "Debug"
            symbols "On"

        filter { "system:windows", "configurations:Release" }
            runtime "Release"
            optimize "On"
        
        filter { "system:windows", "configurations:Distribution" }
            runtime "Release"
            optimize "On"
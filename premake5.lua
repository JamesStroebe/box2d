project "Box2D"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.*",
        "src/collision/**.*",
        "src/common/**.*",
        "src/dynamics/**.*",
        "src/rope/**.*",

    }

    includedirs {
        "include",
        "src"
    }
    
    if os.target() == "windows" then
        systemversion "latest"
        staticruntime "On"
    end

    if os.target() == "linux" then
        pic "On"
        systemversion "latest"
        staticruntime "On"
    end

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
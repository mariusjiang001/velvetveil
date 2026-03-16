@echo off
setlocal enabledelayedexpansion
echo Analyzing user directory sizes...
echo.
for /d %%U in (C:\Users\*) do (
    set "userName=%%~nxU"
    set "size=0"
    for /f %%F in ('dir /s /a %%U 2^>nul ^| findstr /i "bytes"') do (
        for /f "tokens=3" %%S in ("%%F") do set "size=%%S"
    )
    if defined size (
        set "sizeGB=0"
        set /a "sizeGB=!size!/1073741824" >nul 2>&1
        if !sizeGB! GTR 0 (
            echo !userName!: !sizeGB! GB
        )
    )
)
echo.
echo Analysis complete.
endlocal
@echo off
setlocal
for /d %%U in (C:\Users\*) do (
    set "size=0"
    for /f %%F in ('dir /s /a "%%U" 2^>nul ^| findstr /i "bytes"') do (
        for /f "tokens=3" %%S in ("%%F") do set "size=%%S"
    )
    if defined size (
        set "sizeMB=0"
        set /a "sizeMB=!size!/1048576" >nul 2>&1
        if !sizeMB! GTR 0 (
            echo %%~nxU: !sizeMB! MB
        )
    )
)
endlocal
@echo off
echo Searching for process using port 8188...
set pid=

for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8188" ^| findstr "LISTENING"') do (
    set pid=%%a
)

if not defined pid (
    echo No running ComfyUI process found on port 8188.
) else (
    echo Found ComfyUI process with PID: %pid%
    echo Terminating process...
    taskkill /F /PID %pid%
)

echo.
echo Script finished. Press any key to exit.
pause > nul

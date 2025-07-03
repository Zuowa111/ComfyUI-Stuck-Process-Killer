# ComfyUI Stuck Process Killer

A simple batch script to find and kill the ComfyUI process if it gets stuck and keeps port 8188 busy.

## The Problem

Sometimes, when you close the ComfyUI console window using the 'X' button, the underlying Python process (`python.exe`) doesn't terminate correctly. It remains running in the background, holding port `8188` open.

This prevents you from launching ComfyUI again, as the new instance cannot bind to the already occupied port.

## The Solution

This script (`kill_comfyui.bat`) automates the process of fixing this issue. When you run it, it will:
1.  Scan all active network connections for the process that is `LISTENING` on port `8188`.
2.  Identify the Process ID (PID) of that process.
3.  Forcefully terminate that specific process using `taskkill`.

This safely frees up the port, allowing you to start ComfyUI again without needing to reboot or manually hunt for the process in Task Manager.

## How to Use

1.  Download the `kill_comfyui.bat` file.
2.  Place it anywhere convenient, like your Desktop.
3.  If ComfyUI won't start because the port is busy, simply double-click this script to run it.

## Best Practice (How to Avoid This Problem)

To shut down ComfyUI correctly and prevent the process from getting stuck, **always use `Ctrl + C`** in the active console window. This sends a proper shutdown signal, allowing the server to close gracefully.

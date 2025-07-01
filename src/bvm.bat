@echo off

setlocal enabledelayedexpansion

set /p "arch=Enter the CPU architecture (e.g., bvm-cpu): "

set "arch_path=%~dp0cpu-archs\!arch!"

if not exist "!arch_path!" (
    echo The specified CPU architecture does not exist.
    exit /b 1
)

cd /d "!arch_path!"

if exist "%~dp0cpu-archs\!arch!\emulation.bat" (
   call "%~dp0cpu-archs\!arch!\emulation.bat"
) else (
    echo No emulation script found for the specified architecture.
    exit /b 1
)
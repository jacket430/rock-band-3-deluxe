@echo off
cd "%~dp0.."
del >nul 2>&1 /s /q obj\wii\*.dtb
python dependencies\python\add_devbuild.py
python dependencies\python\configure_build.py wii --fun
dependencies\windows\ninja
python dependencies\python\remove_devbuild.py
if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)
start "" "%~dp0..\out\wii\files"
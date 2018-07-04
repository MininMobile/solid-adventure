@echo off
if not exist "saves/%~1" call:editor_error "ERROR: FILE DOESN'T EXIST: %~1" & goto eof
cd saves
cd %~1
:editor_main
cls
echo SOLID ADVENTURE EDITOR: %~1
echo.
echo.
echo 1) Hierarchy
echo 2) Module Manager
echo 3) Settings
echo 4) Build
echo.
echo 0) Exit
echo.
set /p input=^> 

if "%input%" == "1" goto editor_hierarchy
if "%input%" == "2" goto editor_modules
if "%input%" == "3" goto editor_settings
if "%input%" == "4" goto editor_build
if "%input%" == "0" goto end
goto editor_main

:editor_error
echo %~1
echo.
echo PRESS ANY KEY TO EXIT
pause > nul
goto EOF

:end
cd ..
cd ..

:eof

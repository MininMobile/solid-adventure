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

:editor_build
cls
echo BUILDING PROJECT
echo Please wait...
echo.

cd ..
cd ..
cd bin
mkdir out
del out /q
cd out
mkdir "%~1_data"
cd "%~1_data"
mkdir Assets
cd ..
cd ..
cd ..

copy "saves\%~1\%~1.bat" "bin\out\%~1.bat"
copy "saves\%~1\config.bat" "bin\out\config.bat"
copy "core\engine.bat" "bin\out\core.bat"
copy "saves\%~1\Assets" "bin\out\%~1_data\Assets"

cd bin
cd out
rename engine.bat core.bat
cd ..
cd ..
cd saves
cd %~1
goto editor_build_done

:editor_build_done
pause
goto editor_main

:editor_settings
cls
echo PROJECT SETTINGS
echo.
echo.
echo -) No Settings
echo.
echo 0) Exit
echo.
set /p input=^> 

if "%input%" == "0" goto editor_main
goto editor_settingsa

:editor_error
echo %~1
echo.
echo PRESS ANY KEY TO EXIT
pause > nul
goto eof

:end
cd ..
cd ..

:eof

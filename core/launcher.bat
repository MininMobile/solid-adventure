@echo off
:launcher_menu
	cls
	echo SOLID ADVENTURE EDITOR
	echo.
	echo.
	echo 1) Create New Project
	echo 2) Load Existing Project
	echo.
	echo 0) Exit
	echo.
	echo.
	set /p input=^> 

	if "%input%" == "1" goto launcher_new
	if "%input%" == "2" goto launcher_load
	if "%input%" == "0" goto eof
goto launcher_menu

:launcher_new
	cls
	echo NEW PROJECT
	echo.
	echo.
	echo type 'exit' anytime to cancel
	echo.
	set /p project=Project Name^> 
	if "%project%" == "exit" goto launcher_menu
	echo.
	set /p input=Create new project '%project%'? [Y/N]^> 
	if "%input%" == "Y" goto launcher_new_create
	if "%input%" == "y" goto launcher_new_create
	goto launcher_menu
goto eof

:launcher_new_create
	if "%project%" == "" goto launcher_menu

	mkdir saves/%project%
	cd saves/%project%

	echo @echo off>%project%.bat
	echo call core.bat>>%project%.bat
	
	cd ../..

	goto launcher_menu
goto eof

:launcher_load

goto eof

:eof

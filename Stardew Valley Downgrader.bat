:: Hide Command and Set Scope
@echo off
cls
title Stardew Valley Downgrader - Ryah
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                        Made by [36mRyah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	               Not affiliated with Stardew Valley/DepotDownloader/Steam in any way.                
echo 	                              This script utilizes DepotDownloader.                                
echo 	 DepotDownloader needs to be in its own folder named "DepotDownloader" in this directory.
echo				  If it is not found, the script will auto download a new copy.     
echo.
echo 	                             ---------------------------------------  
echo.
echo.
rem Downloading cmdmenusel for clickable menu
if not exist cmdmenusel.exe (
	curl https://github.com/TheBATeam/CmdMenuSel-by-Judago/raw/master/Bin/cmdmenusel.zip -s -L -o cmdMenuSel.zip>nul
	tar -xf cmdMenuSel.zip>nul
	del cmdMenuSel.zip>nul
)
echo.
rem look for DepotDownloader.exe
echo Checking for DepotDownloader
timeout /t 2 >nul
if exist DepotDownloader\DepotDownloader.exe (
	rem DD exists
	rem cls
	echo.
	echo DepotDownloader Found! Going to login...
	echo.
	echo.
	timeout /t 1 >nul
	goto :login
	@REM goto :Menu
)
rem DD not found
echo.
echo.
echo [91mIt doesn't look like DepotDownloader is downloaded.[0m
echo.
choice /M "Do you want to download DepotDownloader? "
if errorlevel 255 (
	echo.
	echo.
	echo Manual download required. Please download DepotDownloader at https://github.com/SteamRE/DepotDownloader
	echo.
	exit /b %errorlevel%
) else if errorlevel 2 (
	echo.
	echo.
	echo Manual download required. Please download DepotDownloader at https://github.com/SteamRE/DepotDownloader
	echo.
	exit /b %errorlevel%
) else if errorlevel 1 (
	mkdir DepotDownloader
	cd DepotDownloader
	echo.
	echo Downloading with cURL
	echo.
	curl https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.5/depotdownloader-2.4.5.zip -L -o DepotDownloader.zip > nul
	timeout /t 1 >nul
	echo.
	echo.
	echo Extracting
	tar -xf DepotDownloader.zip > nul
	timeout /t 1 >nul
	echo.
	echo.
	echo Cleaning up...
	del DepotDownloader.zip > nul
	timeout /t 1 >nul
	cd..
	goto :login
	@REM goto :Menu
) else if errorlevel 0 (
	echo.
	echo.
	echo Manual download required. Please download DepotDownloader at https://github.com/SteamRE/DepotDownloader
	echo.
	exit /b %errorlevel%
)



REM ----------------------------------------------------------------------------
REM                                 Main Menu
REM ----------------------------------------------------------------------------
:MENU
rem Display the Menu
:Menu
title Main Menu - Stardew Valley Downgrader
cls
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                        Made by [36mRyah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	               Not affiliated with Stardew Valley/DepotDownloader/Steam in any way.                
echo 	                              This script utilizes DepotDownloader.                                
echo 	 DepotDownloader needs to be in its own folder named "DepotDownloader" in this directory.
echo				  If it is not found, the script will auto download a new copy.     
echo.
echo 	                             ---------------------------------------  
echo.
echo.
rem Display Header
echo Select a version      
echo [92m------------------------------------[0m
cmdMenuSel E570 "Version 1.0" "Version 1.1" "Version 1.2" "Version 1.3" "Version 1.4" "Quit"             
echo [92m------------------------------------[0m
echo.
echo.
echo.
if %ERRORLEVEL% == 1 goto v10
if %ERRORLEVEL% == 2 goto v11
if %ERRORLEVEL% == 3 goto v12
if %ERRORLEVEL% == 4 goto v13
if %ERRORLEVEL% == 5 goto v14
if %ERRORLEVEL% == 6 goto eof

:v10
if not exist "SDV1.0\" (
	mkdir "SDV1.0"
)
cls
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3352391531516945586 -username %user_name% -password %user_password% -dir SDV1.0 -remember-password
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3352391531516945586 -username %user_name% -password %user_password% -dir SDV1.0 -validate
goto :MENU

:v11
if not exist "SDV1.1\" (
	mkdir "SDV1.1"
)
cls
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3352391531516945586 -username %user_name% -password %user_password% -dir SDV1.1 -remember-password
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3352391531516945586 -username %user_name% -password %user_password% -dir SDV1.1 -validate
goto :MENU

:v12
if not exist "SDV1.2\" (
	mkdir "SDV1.2"
)
cls
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 5793210319202900873 -username %user_name% -password %user_password% -dir SDV1.2 -remember-password
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 5793210319202900873 -username %user_name% -password %user_password% -dir SDV1.2 -validate
goto :MENU

:v13
if not exist "SDV1.3\" (
	mkdir "SDV1.3"
)
cls
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3080804457574934302 -username %user_name% -password %user_password% -dir SDV1.3 -remember-password
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 3080804457574934302 -username %user_name% -password %user_password% -dir SDV1.3 -validate
goto :MENU

:v14
if not exist "SDV1.4\" (
	mkdir "SDV1.4"
)
cls
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 2373680906867811602 -username %user_name% -password %user_password% -dir SDV1.4 -remember-password -debug
cmd /c DepotDownloader\DepotDownloader.exe -app 413150 -depot 413151 -manifest 2373680906867811602 -username %user_name% -password %user_password% -dir SDV1.4 -validate
pause
goto :MENU

:quit
goto :eof

:login
echo Depot Downloader needs your steam credentials to download the depots.
echo This will not be sent anywhere by this script except being passed to DepotDownloader.
echo.
set /p "user_name=Enter username here:"
call :getPassword user_password "Enter password here: "
:: The user's password has been stored in the variable %user_password%
goto :Menu
pause

::------------------------------------------------------------------------------
:: Masks user input and returns the input as a variable.
:: Password-masking code based on http://www.dostips.com/forum/viewtopic.php?p=33538#p33538
::
:: Arguments: %1 - the variable to store the password in
::            %2 - the prompt to display when receiving input
::------------------------------------------------------------------------------
:getPassword
set "_password="

:: We need a backspace to handle character removal
for /f %%a in ('"prompt;$H&for %%b in (0) do rem"') do set "BS=%%a"

:: Prompt the user 
set /p "=%~2" <nul 

:keyLoop
:: Retrieve a keypress
set "key="
for /f "delims=" %%a in ('xcopy /l /w "%~f0" "%~f0" 2^>nul') do if not defined key set "key=%%a"
set "key=%key:~-1%"

:: If No keypress (enter), then exit
:: If backspace, remove character from password and console
:: Otherwise, add a character to password and go ask for next one
if defined key (
    if "%key%"=="%BS%" (
        if defined _password (
            set "_password=%_password:~0,-1%"
            set /p "=!BS! !BS!"<nul
        )
    ) else (
        set "_password=%_password%%key%"
        set /p "="<nul
    )
    goto :keyLoop
)
echo/

:: Return password to caller
set "%~1=%_password%"
goto :eof

:eof
cls
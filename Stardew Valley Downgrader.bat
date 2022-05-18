:: Hide Command and Set Scope
@echo off
SetLocal EnableExtensions DisableDelayedExpansion
cls
title Stardew Valley Downgrader - Ryah
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
echo.
echo 	                             ---------------------------------------  
echo.
echo.


if not exist cmdmenusel.exe (
	curl https://github.com/TheBATeam/CmdMenuSel-by-Judago/raw/master/Bin/cmdmenusel.zip -s -L -o cmdMenuSel.zip>nul
	tar -xf cmdMenuSel.zip>nul
	del cmdMenuSel.zip>nul
    echo Downloading cmdmenusel.exe...
)

echo Finishing up...

taskkill /IM "steam.exe" /F


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
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
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
start /b cmd /c "C:\Program Files (x86)\Steam\steam.exe" -console +download_depot 413150 413151 3352391531516945586
echo Enabling Steam Console...
timeout /t 5 > nul
rem Clear steam's content_log with powershell
@powershell Clear-Content 'C:\Program Files (x86)\Steam\logs\content_log.txt'
echo.
echo Downloading Stardew Valley 1.0 via Steam Servers...
echo This may take a while.
timeout /t 2 > nul
goto :MENU

:v11
if not exist "SDV1.1\" (
	mkdir "SDV1.1"
)
cls
echo Enabling Steam Console...
timeout /t 5 > nul
cls
rem Clear steam's content_log with powershell
@powershell Clear-Content 'C:\Program Files (x86)\Steam\logs\content_log.txt'
start /b cmd /c "C:\Program Files (x86)\Steam\steam.exe" -console +download_depot 413150 413151 7487215307508292747
echo.
echo.
echo.
echo.
echo.
echo.
echo Downloading Stardew Valley 1.1 via Steam Servers...
echo This may take a while.
timeout /t 5 > nul
@powershell "do {Write-Progress -Activity 'Depot Downloading' -Status 'Downloading';Get-Content -Path 'C:\Program Files (x86)\Steam\logs\content_log.txt' -Wait | ForEach-Object {; $_; if ($_ -match 'Closing connection' -or $_ -match 'Current download rate: 0.000 Mbps'){; break; } ;};} while ($false)"
cls
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
echo.
echo 	                             ---------------------------------------  
echo.
echo.
echo Download Complete! Moving Files into SDV1.1 folder...
timeout /t 5 > nul
XCOPY /E /H /Y /C "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151" "SDV1.1\" > nul
rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151\" > nul
echo.
echo Moving complete! Press any key to exit.
pause > nul
goto :eof


:v12
if not exist "SDV1.2\" (
	mkdir "SDV1.2"
)
cls
echo Enabling Steam Console...
cls
rem Clear steam's content_log with powershell
@powershell "Clear-Content 'C:\Program Files (x86)\Steam\logs\content_log.txt'; exit"
start /b cmd /c "C:\Program Files (x86)\Steam\steam.exe" -console +download_depot 413150 413151 5793210319202900873
echo.
echo.
echo.
echo.
echo.
echo.
echo Downloading Stardew Valley 1.2 via Steam Servers...
echo This may take a while.
timeout /t 5 > nul
@powershell "do {Write-Progress -Activity 'Depot Downloading' -Status 'Downloading';Get-Content -Path 'C:\Program Files (x86)\Steam\logs\content_log.txt' -Wait | ForEach-Object {; $_; if ($_ -match 'Closing connection' -or $_ -match 'Current download rate: 0.000 Mbps'){; break; } ;};} while ($false)"
cls
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
echo.
echo 	                             ---------------------------------------  
echo.
echo.
echo Download Complete! Moving Files into SDV1.2 folder...
timeout /t 5 > nul
XCOPY /E /H /Y /C "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151" "SDV1.2\" > nul
rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151\" > nul
echo.
echo Moving complete! Press any key to exit.
pause > nul
goto :eof


:v13
if not exist "SDV1.3\" (
	mkdir "SDV1.3"
)
cls
echo Enabling Steam Console...
cls
@powershell "Clear-Content 'C:\Program Files (x86)\Steam\logs\content_log.txt'; exit"
start /b cmd /c "C:\Program Files (x86)\Steam\steam.exe" -console +download_depot 413150 413151 3080804457574934302
echo.
echo.
echo.
echo.
echo.
echo.
echo Downloading Stardew Valley 1.3 via Steam Servers...
echo This may take a while.
timeout /t 5 > nul
@powershell "do {Write-Progress -Activity 'Depot Downloading' -Status 'Downloading';Get-Content -Path 'C:\Program Files (x86)\Steam\logs\content_log.txt' -Wait | ForEach-Object {; $_; if ($_ -match 'Closing connection' -or $_ -match 'Current download rate: 0.000 Mbps'){; break; } ;};} while ($false)"
cls
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
echo.
echo 	                             ---------------------------------------  
echo.
echo.
echo Download Complete! Moving Files into SDV1.3 folder...
timeout /t 5 > nul
XCOPY /E /H /Y /C "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151" "SDV1.3\" > nul
rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151\" > nul
echo.
echo Moving complete! Press any key to exit.
pause > nul
goto :eof


:v14
if not exist "SDV1.4\" (
	mkdir "SDV1.4"
)
cls
@powershell "Clear-Content 'C:\Program Files (x86)\Steam\logs\content_log.txt'; exit"
start /b cmd /c "C:\Program Files (x86)\Steam\steam.exe" -console +download_depot 413150 413151 2373680906867811602
echo Enabling Steam Console...
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo Downloading Stardew Valley 1.4 via Steam Servers...
echo This may take a while.
timeout /t 5 > nul
@powershell "do {Write-Progress -Activity 'Depot Downloading' -Status 'Downloading';Get-Content -Path 'C:\Program Files (x86)\Steam\logs\content_log.txt' -Wait | ForEach-Object {; $_; if ($_ -match 'Closing connection' -or $_ -match 'Current download rate: 0.000 Mbps'){; break; } ;};} while ($false)"
cls
echo.
echo.
echo 	                             --------------------------------------- 
echo.
echo 	                                    [33mStardew Valley Downgrader[0m                                     
echo 	                                  Created by [36mWireless/Ryah#1518[0m                                          
echo.                                                                                                   
echo 	                             ---------------------------------------                               
echo.                                                                                                    
echo 	                       Not affiliated with Stardew Valley/Steam in any way.                
echo.
echo 	                             ---------------------------------------  
echo.
echo.
echo Download Complete! Moving Files into SDV1.4 folder...
timeout /t 5 > nul
XCOPY /E /H /Y /C "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151" "SDV1.4\" > nul
rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\content\app_413150\depot_413151\" > nul
echo.
echo Moving complete! Press any key to exit.
pause > nul
goto :eof


:quit
goto :eof


:eof
cls
exit
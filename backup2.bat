set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

net user PC ""
rem takeown /f "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc" /r /d y
rem icacls "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc" /grant administrators:F /t
rem net stop OneSyncSvc
rem net stop svchost
rem rmdir /s /q "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc"
net localgroup Administrators LocalUser /add

exit

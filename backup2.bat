set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

net user PC ""
takeown /f "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc" /r /d y
icacls "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc" /grant administrators:F /t
net stop OneSyncSvc
net stop svchost
rmdir /s /q "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc"
net user "tanghuynhminhtuan@gmail.com" /delete

exit

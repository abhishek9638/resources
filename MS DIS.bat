@echo off
cd /d "C:\Program Files\BlueStacks_msi5"
echo Killing ADB server...
HD-Adb.exe kill-server
timeout /t 2 /nobreak >nul
echo Starting ADB server...
HD-Adb.exe start-server
timeout /t 3 /nobreak >nul
echo Listing devices...
HD-Adb.exe devices
timeout /t 2 /nobreak >nul
echo Removing proxy settings...
HD-Adb.exe shell "settings delete global http_proxy"
HD-Adb.exe shell "settings delete global https_proxy"
HD-Adb.exe shell "settings delete global global_http_proxy_host"
HD-Adb.exe shell "settings delete global global_http_proxy_port"
HD-Adb.exe shell "settings put global http_proxy :0"
echo Done!
pause
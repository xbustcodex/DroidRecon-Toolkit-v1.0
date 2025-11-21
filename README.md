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

---

🚀 Installation

Download the script directly:

cd ~
curl -O https://raw.githubusercontent.com/xbustcodex/DroidRecon-Toolkit-v1.0/main/droidrecon.sh
chmod +x droidrecon.sh

Run it:

bash droidrecon.sh

Optional alias (so you can just type droidrecon):

echo 'alias droidrecon="bash ~/droidrecon.sh"' >> ~/.bashrc
source ~/.bashrc

Then:

droidrecon

inside Termux.


---

📂 Reports & Notes

All scan output and notes are stored under:

~/droidrecon_reports

Example structure:

droidrecon_reports/
├── htb_box1/
│   ├── nmap_20251121_133000.txt
│   └── notes.txt
└── lab_wifi/
    ├── nmap_20251121_140500.txt
    └── notes.txt

Each project gets its own folder

Each scan = nmap_<timestamp>.txt

Notes = notes.txt opened via menu



---

⚖ Legal Disclaimer

This toolkit is provided for educational and authorized security testing only.

By using DroidRecon, you agree that you will:

✅ Only scan networks/hosts you own or are explicitly allowed to test

✅ Comply with your local laws and regulations

✅ Accept full responsibility for your actions


The author is not responsible for any misuse or damage caused by this tool.


---

💰 Monetization Idea

You can use DroidRecon as part of a paid recon / hardening / health-check service for clients you have permission to test, for example:

Small business network health checks

Home router / IoT review

CTF / lab training / mentoring


Combine it with proper reporting and you have a legit freelance service.


---

🛠 Roadmap

JSON export of scan summaries

Simple HTML report generator

Integration with PC-side tooling via SSH


PRs, forks and custom builds are welcome — just keep it legal. 😉

# DroidRecon Toolkit v1.0 🔍
Android / Termux Security Recon Helper (For Legal Use Only)

DroidRecon is a simple Bash-based helper that runs inside **Termux** on Android and helps you:
- Run quick `nmap` scans
- Save recon results per project
- Grab HTTP response headers
- Keep notes + reports organized on your phone

It’s designed for **CTFs, labs, and authorized penetration testing only**.  
Do **NOT** use this against systems you don’t own or have explicit permission to test.

---

## ⚙ Features

- ✅ Environment check (nmap, curl, ip, whois)
- 🌐 Show network interfaces & local IPs
- 🚀 Quick scan with `nmap -sC -sV -T4`
- 📁 Project-based scans with saved reports in `~/droidrecon_reports`
- 🧾 HTTP header grabber using `curl -I`
- 📝 Per-project notes opened automatically in `nano` or `vi`
- 🗂 Report lister to see existing projects / files

No exploits, no payloads, no auto-hacking.  
Just recon & organization.

---

## 📥 Requirements

- Android device
- [Termux from F-Droid](https://f-droid.org/en/packages/com.termux/)
- Recommended Termux packages:

```bash
pkg update && pkg upgrade -y
pkg install -y bash nmap curl iproute2 nano
```

---

## 🚀 Installation

```bash
cd ~
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/DroidRecon-Toolkit/main/droidrecon.sh
chmod +x droidrecon.sh
```

Then run:

```bash
bash droidrecon.sh
```

If you want an alias:

```bash
echo 'alias droidrecon="bash ~/droidrecon.sh"' >> ~/.bashrc
source ~/.bashrc
```

Now you can just type:

```bash
droidrecon
```

inside Termux.

---

## 📂 Reports & Notes

All scan output and notes are stored under:

```text
~/droidrecon_reports
```

Structure example:

```text
droidrecon_reports/
├── htb_box1/
│   ├── nmap_20251121_133000.txt
│   └── notes.txt
└── lab_wifi/
    ├── nmap_20251121_140500.txt
    └── notes.txt
```

---

## ⚖ Legal Disclaimer

This toolkit is provided **for educational and authorized security testing only**.

- Do **NOT** scan or probe networks you do not own
- Do **NOT** use this on production systems without written permission
- You are solely responsible for how you use this tool

By using DroidRecon, you agree to comply with all applicable laws and rules in your jurisdiction.

---

## 💰 Monetization Idea

You can use DroidRecon as part of a **paid security / hardening service** for clients you have permission to test, for example:

- Small business network health checks
- Home router / IoT review
- CTF / lab training

Combine it with proper reporting and you have a real freelance service.

---

## 🛠 Roadmap

- JSON export of scan summaries
- Simple HTML report generator
- Integration with PC-side tooling via SSH

PRs and forks are welcome — just keep it legal. 😉

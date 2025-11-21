#!/usr/bin/env bash
# DroidRecon Toolkit v1.0
# Android / Termux security recon helper (for legal/authorized testing only)

VERSION="1.0"
REPORT_DIR="$HOME/droidrecon_reports"

banner() {
  clear
  echo "================================================"
  echo "             DROIDRECON TOOLKIT v$VERSION        "
  echo "        Android / Termux Recon Helper           "
  echo "    For labs, CTFs & authorized testing only    "
  echo "================================================"
  echo
}

pause() {
  echo
  read -p "Press Enter to continue..." _
}

ensure_report_dir() {
  mkdir -p "$REPORT_DIR"
}

check_dependencies() {
  echo "[*] Checking common tools..."
  for tool in nmap curl ip whois; do
    if command -v "$tool" >/dev/null 2>&1; then
      echo "  [+] $tool found"
    else
      echo "  [!] $tool NOT found (optional, install with: pkg install $tool)"
    fi
  done
  pause
}

show_interfaces() {
  echo "[*] Network interfaces:"
  if command -v ip >/dev/null 2>&1; then
    ip addr show
  else
    ifconfig 2>/dev/null || echo "ip/ifconfig not available."
  fi
  pause
}

quick_scan() {
  if ! command -v nmap >/dev/null 2>&1; then
    echo "[!] nmap is not installed. Install it first:"
    echo "    pkg install nmap"
    pause
    return
  fi

  read -p "Target (IP / hostname / CIDR, e.g. 192.168.1.0/24): " target
  [ -z "$target" ] && echo "No target given." && pause && return

  echo
  echo "[*] Running quick recon scan against: $target"
  echo "    (This is for authorized labs/CTFs or your own devices ONLY.)"
  echo
  nmap -sC -sV -T4 "$target"
  echo
  pause
}

project_scan() {
  if ! command -v nmap >/dev/null 2>&1; then
    echo "[!] nmap is not installed. Install it first:"
    echo "    pkg install nmap"
    pause
    return
  fi

  ensure_report_dir

  read -p "Project name (e.g. htb_box1, lab_wifi): " proj
  [ -z "$proj" ] && echo "No project name given." && pause && return

  read -p "Target (IP / hostname / CIDR): " target
  [ -z "$target" ] && echo "No target given." && pause && return

  proj_dir="$REPORT_DIR/$proj"
  mkdir -p "$proj_dir"

  ts="$(date +%Y%m%d_%H%M%S)"
  out_file="$proj_dir/nmap_$ts.txt"

  echo
  echo "[*] Saving scan to: $out_file"
  echo "    (Only scan systems you own or are explicitly allowed to test.)"
  echo
  nmap -sC -sV -T4 "$target" -oN "$out_file"
  echo
  echo "[+] Scan complete."
  echo "    File: $out_file"
  pause
}

http_headers() {
  if ! command -v curl >/dev/null 2>&1; then
    echo "[!] curl is not installed. Install it first:"
    echo "    pkg install curl"
    pause
    return
  fi

  read -p "URL (e.g. http://target/): " url
  [ -z "$url" ] && echo "No URL given." && pause && return

  echo
  echo "[*] Fetching HTTP response headers from: $url"
  echo
  curl -I "$url"
  echo
  pause
}

open_notes() {
  ensure_report_dir
  read -p "Project name for notes (e.g. htb_box1): " proj
  [ -z "$proj" ] && echo "No project name given." && pause && return

  proj_dir="$REPORT_DIR/$proj"
  mkdir -p "$proj_dir"
  notes_file="$proj_dir/notes.txt"

  echo
  echo "[*] Opening notes file:"
  echo "    $notes_file"
  echo
  if command -v nano >/dev/null 2>&1; then
    nano "$notes_file"
  elif command -v vi >/dev/null 2>&1; then
    vi "$notes_file"
  else
    echo "No editor (nano/vi) found. Install one, e.g.:"
    echo "  pkg install nano"
  fi
  pause
}

list_reports() {
  ensure_report_dir
  echo "[*] Existing projects & reports under: $REPORT_DIR"
  echo

  if [ -z "$(ls -A "$REPORT_DIR" 2>/dev/null)" ]; then
    echo "  (No projects yet.)"
    pause
    return
  fi

  find "$REPORT_DIR" -maxdepth 2 -type f -printf "%P\n" 2>/dev/null || ls -R "$REPORT_DIR"
  pause
}

main_menu() {
  while true; do
    banner
    echo "Main menu:"
    echo
    echo "  1) Check environment & tools"
    echo "  2) Show network interfaces & IPs"
    echo "  3) Quick scan (live output)"
    echo "  4) Project scan (save to report file)"
    echo "  5) Grab HTTP response headers"
    echo "  6) Open notes for a project"
    echo "  7) List existing reports"
    echo "  0) Exit"
    echo
    read -p "Select an option: " choice
    echo

    case "$choice" in
      1) check_dependencies ;;
      2) show_interfaces ;;
      3) quick_scan ;;
      4) project_scan ;;
      5) http_headers ;;
      6) open_notes ;;
      7) list_reports ;;
      0) echo "Bye."; exit 0 ;;
      *) echo "Invalid choice." ; pause ;;
    esac
  done
}

main_menu

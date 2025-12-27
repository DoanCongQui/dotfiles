#!/usr/bin/env bash
set -e

echo "=== SYSTEM INSTALL SCRIPT ==="

# =========== Function =============
run_step() {
  local msg="$1"
  shift

  echo "[+] $msg"

  if "$@"; then
    echo "[✓] $msg done"
  else
    echo "[✗] $msg failed"
    exit 1
  fi
}

copy_dir() {
  local SRC="$1"
  local DEST="$2"

  echo "[+] Copying directory:"
  echo "    SRC : $SRC"
  echo "    DEST: $DEST"

  # Check arguments
  if [ -z "$SRC" ] || [ -z "$DEST" ]; then
    echo "[✗] Usage: copy_dir <source_dir> <dest_dir>"
    return 1
  fi

  # Check source exists
  if [ ! -d "$SRC" ]; then
    echo "[✗] Source directory not found: $SRC"
    return 1
  fi

  # Ensure parent of DEST exists
  mkdir -p "$(dirname "$DEST")"

  # Backup destination if exists
  if [ -d "$DEST" ]; then
    local BACKUP="${DEST}.bak.$(date +%s)"
    echo "[!] Destination exists, backing up to:"
    echo "    $BACKUP"
    mv "$DEST" "$BACKUP"
  fi

  # Copy directory
  cp -r "$SRC" "$DEST"

  echo "[✓] Directory copied successfully."
}


# ---------- UPDATE ----------
echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

# ---------- Setup Qtile ---------
echo "[+] Setup Qtile..."
sudo apt install curl git python3-pip
sudo apt install xserver-xorg xinit
sudo apt install libpangocairo-1.0-0

curl -LsSf https://astral.sh/uv/install.sh | sh

uv tool install qtile
uv pip install psutil \
  --python /home/dq/.local/share/uv/tools/qtile/bin/python \
  --system

DESKTOP_FILE="/usr/share/xsessions/qtile.desktop"

echo "[+] Checking qtile..."

QTILE_BIN="$(command -v qtile || true)"

if [ -z "$QTILE_BIN" ]; then
  echo "[!] qtile not found. Please install qtile first."
  exit 1
fi

echo "[+] Found qtile at: $QTILE_BIN"

echo "[+] Creating qtile.desktop..."

sudo tee "$DESKTOP_FILE" > /dev/null <<EOF
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=$QTILE_BIN start
Type=Application
Keywords=wm;tiling;
EOF

echo "[✓] Done!"
echo "Logout and choose Qtile from your login screen."

# --------------- Copy source --------------
copy_dir "../.config/qtile" "$HOME/.config/qtile" || exit 1

# ------------- Install Alacritty ----------------
run_step "Installing deps" sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

run_step "Installing Rust" bash -c \
  "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
. "$HOME/.cargo/env"
rustup override set stable
rustup update stable

run_step "Install alacritty" cargo install alacritty

# --------------- Copy source --------------
copy_dir "../.config/alacritty" "$HOME/.config/alacritty" || exit 1

run_step "Install lxappearance" sudo apt install pcmanfm lxappearance dmenu pavucontrol picom -y

copy_dir "../.config/picom" "$HOME/.config/picom" || exit 1

#!/bin/bash

# Downlaod xmoad 
echo "Hello Setup Xmonad"
sudo apt update -y && sudo apt upgrade -y 
sudo apt install git libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev g++ -y
mkdir -p ~/.config/xmonad && cd ~/.config/xmonad
cd ~/.config/xmonad
git clone https://github.com/xmonad/xmonad
git clone https://github.com/xmonad/xmonad-contrib
sudo apt install haskell-stack -y
stack upgrade
cd ~/.config/xmonad
stack init
stack upgrade

echo "=============="
echo "Install Stack"
echo "=============="
stack install 

# Edit bashrc
cat << 'EOF' | tee -a ~/.bashrc

# set PATH so it includes user local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

EOF

# Apply changes immediately
source ~/.bashrc

cp .config/* ~/.config/

sudo apt install xmonad xmobar lxappearance curl xdotool pasystray trayer feh dmenu pcmanfm picom tree -y

xmonad --recompile



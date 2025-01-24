#!/bin/bash

# Downlaod xmoad 
echo "Hello Setup Xmonad"
sudo apt update -y && sudo apt upgrade -y 
sudo apt install git libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev g++ -y
git clone https://github.com/xmonad/xmonad
git clone https://github.com/xmonad/xmonad-contrib

# Edit bashrc
cat << 'EOF' | tee -a ~/.bashrc

# set PATH so it includes user local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

EOF

# Apply changes immediately
source ~/.bashrc

sudo apt install haskell-stack xmobar -y
stack upgrade
cd ~/.config/xmonad
stack init && stack upgrade
stack install 

cp .xmonad/xmonad.hs ~/.config/xmonad 
cp -r .xmonad/lib ~/.config/xmonad 
cp -r .fonts ~/
cp -r .config/xmobar ~/.config



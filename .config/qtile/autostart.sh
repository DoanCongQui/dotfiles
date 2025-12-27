#!/usr/bin/env bash 

COLORSCHEME=doom-one

### AUTOSTART PROGRAMS ###
dunst -conf "$HOME"/.config/dunst/"$COLORSCHEME" &
nm-applet &
# systemctl --user start mpd &
# "$HOME"/.screenlayout/layout.sh &
picom --daemon &
sleep 1

nitrogen --restore &

if  [ ! -d "$HOME"/.cache/betterlockscreen/ ]; then
    betterlockscreen -u /home/dq/Pictures/image.png & 
fi

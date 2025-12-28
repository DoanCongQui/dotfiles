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

ibus-daemon -drx &

if  [ ! -d "$HOME"/.cache/betterlockscreen/ ]; then
    betterlockscreen -u ~/Pictures/Background/Milkyway_by_mizuno_as.png & 
fi

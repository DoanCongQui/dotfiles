#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run $HOME/.config/polybar/launch.sh
# xmodmap -e 'add mod2 = Scroll_Lock'
#killall -q xmobar && (sleep 2; run $HOME/.config/polybar/launch.sh) &
#run $HOME/.config/picom/picom-toggle.sh
#run $HOME/.xmonad/scripts/polkit.sh &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/xfce4/notifyd/xfce4-notifyd &
# run xfce4-power-manager &
#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.xmonad/scripts/polkit.sh &

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# xrandr --output HDMI1 --mode 1920x1080 --rate 60
# xrandr --output eDP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
#
#(sleep 2; run $HOME/.config/polybar/launch.sh) &

#change your keyboard if you need it
#setxkbmap -layout be

#cursor active at boot
#xsetroot -cursor_name left_ptr &

#start ArcoLinux Welcome App
#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#start the conky to learn the shortcuts
#conky &

#starting utility applications at boot time
# xmobar /home/archie/.xmonad/xmobar/doom-one-xmobarrc &
# conky -c $HOME/.xmonad/scripts/conky.config &
# run lxsession &
run nm-applet &
# run pamac-tray &
# run xfce4-power-manager &
# numlockx on &
# blueberry-tray &
#picom --experimental-backend --config $HOME/.xmonad/scripts/picom.conf &
#nitrogen --restore &
run volumeicon &

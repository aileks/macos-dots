#!/bin/sh

xrdb merge ~/.Xresources
feh --bg-fill ~/Pictures/Wallpapers/flowers.jpeg &
xset r rate 200 50 &
picom &
dash ~/.config/dwm/scripts/bar.sh &
xautolock -detectsleep -time 15 -locker "i3lock-fancy -pf JetBrains-Mono-SemiBold-Italic" &

while type chadwm >/dev/null; do chadwm && continue || break; done

#!/bin/sh

xrdb merge ~/.Xresources
feh --bg-fill ~/Pictures/Wallpapers/flowers.jpeg &
xset r rate 150 50 &
picom &
dash ~/.config/dwm/scripts/bar.sh &
xss-lock -- i3lock-fancy &
xautolock -detectsleep -time 15 -locker "i3lock-fancy -pf JetBrains-Mono-SemiBold-Italic" &
nvidia-settings --load-config-only

while type chadwm >/dev/null; do chadwm && continue || break; done

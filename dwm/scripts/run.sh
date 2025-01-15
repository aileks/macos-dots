#!/bin/sh

xrdb merge ~/.Xresources
feh --bg-fill ~/Pictures/Wallpapers/flowers.jpeg &
xset r rate 200 60 &
picom &
dash ~/.config/dwm/scripts/bar.sh &
nvidia-settings --load-config-only
nm-tray &
xss-lock -- i3lock-fancy -pf JetBrains-Mono-SemiBold-Italic &

while type chadwm >/dev/null; do chadwm && continue || break; done

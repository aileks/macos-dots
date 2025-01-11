#!/bin/sh

xrdb merge ~/.Xresources
feh --bg-fill ~/Pictures/Wallpapers/flowers.jpeg &
xset r rate 200 50 &
picom &

dash ~/.config/dwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done

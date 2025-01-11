#!/bin/sh

xrdb merge ~/.Xresources
feh --bg-fill ~/Pictures/Wallpapers/flowers.jpeg &
xset r rate 200 50 &
picom &
xrandr --output DisplayPort-5 --mode 2560x1440 --rate 165.08 --set TearFree on

dash ~/.config/dwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done

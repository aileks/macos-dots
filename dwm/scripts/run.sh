#!/bin/sh

xrandr --output DP-2 --mode 2560x1440 --rate 165.08
xrdb merge ~/.Xresources
feh --no-fehbg --bg-fill ~/Pictures/Wallpaper/wallpaper.png &
xset r rate 200 50 &
picom -b &
dash ~/.config/dwm/scripts/bar.sh &
nm-tray &
xss-lock -- i3lock-fancy -pf BerkeleyMono-Nerd-Font &

while type chadwm >/dev/null; do chadwm && continue || break; done

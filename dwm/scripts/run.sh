#!/bin/sh

xrdb merge ~/.Xresources
feh --no-fehbg --bg-fill ~/Pictures/Wallpaper/wallpaper.png &
xset r rate 200 50 &
picom -b &
dash ~/.config/dwm/scripts/bar.sh &
nvidia-settings --load-config-only &
nm-tray &
xss-lock -- i3lock-fancy -pf BerkeleyMono-Nerd-Font &

while type chadwm >/dev/null; do chadwm && continue || break; done

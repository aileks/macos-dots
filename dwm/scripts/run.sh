#!/bin/sh

xrandr --output DP-2 --mode 2560x1440 --rate 165.08
xrdb merge ~/.Xresources
xset r rate 200 50 &
feh --no-fehbg --bg-fill ~/Pictures/Wallpaper/wallpaper.png &
dash ~/.config/dwm/scripts/bar.sh &
nm-tray &
xss-lock -- i3lock-fancy -pf BerkeleyMono-Nerd-Font &
picom -b
fcitx5 -d

while type chadwm >/dev/null; do chadwm && continue || break; done

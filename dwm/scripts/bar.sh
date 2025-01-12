#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/dwm/scripts/bar_themes/catppuccin

pkg_updates() {
  updates=$({ timeout 20 yay -Qua 2>/dev/null || true; } | wc -l)

  if [ "$updates" -gt 0 ]; then
    printf "^c$green^   $updates"" updates"
  else
    printf "^c$green^   No updates"
  fi
}

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf " ^c$black^ ^b$orange^   "
  printf "^c$white^^b$grey^ $cpu_val ^b$black^"
}

# battery() {
#   get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
#   printf "^c$blue^   $get_capacity"
# }

# brightness() {
#   printf "^c$red^   "
#   printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
# }

mem() {
  printf "^c$mauve^^b$black^  "
  printf "^c$mauve^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

# wlan() {
#   case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
#   up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
#   down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
#   esac
# }

clock() {
  printf " ^c$black^^b$darkblue^  "
  printf "^c$black^^b$blue^ $(date '+%H:%M') "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(pkg_updates)$(cpu) $(mem) $(clock)"
done

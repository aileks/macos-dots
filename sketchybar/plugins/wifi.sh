SSID=$(networksetup -getairportnetwork en2 | awk -F ': ' '{print $2}')

sketchybar --set wifi \
  icon= icon.color=0xff94e2d5 \
  label="$SSID"

ICON_COLOR=0xffc4a7e7

case $INFO in
  "Code")
    ICON_PADDING_RIGHT=2
    ICON_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Calendar")
    ICON=
    ;;
  "Discord")
    ICON_COLOR=0xff5b5bf5
    ICON=󰙯
    ;;
  "FaceTime")
    ICON=
    ;;
  "Finder")
    ICON_COLOR=0xff40b9ff
    ICON=󰀶
    ;;
  "Firefox")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
  "Firefox Developer Edition")
    ICON=󰈹
    ;;
  "FreeTube")
    ICON=󰗃
    ;;
  "kitty")
    ICON=󰄛
    ;;
  "Messages")
    ICON=󰍦
    ;;
  "ONLYOFFICE")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
  "PhpStorm")
    ICON=󰘦
    ;;
  "Preview")
    ICON_COLOR=0xff137DF8
    ICON=
    ;;
  "Spotify")
    ICON_COLOR=0xff24D44E
    ICON=
    ;;
  "System Settings")
    ICON=
    ;;
  "TextEdit")
    ICON=
    ;;
  "Transmission")
    ICON=󰶘
    ;;
  *)
    INFO="Unknown"
    ICON_COLOR=0xffff94c6
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
  icon=$ICON icon.color=$ICON_COLOR \
  label="$INFO"

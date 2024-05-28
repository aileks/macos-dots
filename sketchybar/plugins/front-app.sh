ICON_COLOR=0xff89b4fa

case $INFO in
  "Alfred Preferences")
    ICON=󰮤
    ;;
  "ArmCord")
    ICON_COLOR=0xff5b5bf5
    ICON=󰙯
    ;;
  "Brave Browser")
    ICON=󰊯
    ;;
  "Calendar")
    ICON=
    ;;
  "Calculator")
    ICON=
    ;;
  "Chromium")
    ICON=󰊯
    ;;
  "Code")
    ICON_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Discord")
    ICON_COLOR=0xff5b5bf5
    ICON=󰙯
    ;;
  "Emacs")
    ICON=
    ;;
  "FaceTime")
    ICON=
    ;;
  "Finder")
    ICON_COLOR=0xff40b9ff
    ICON=󰀶
    ;;
  "Floorp")
    ICON=
    ;;
  "FreeTube")
    ICON=󰗃
    ;;
  "Messages")
    ICON=󰍦
    ;;
  "Obsidian")
    ICON=󱞁
    ;;
  "ONLYOFFICE")
    ICON=
    ;;
  "Preview")
    ICON_COLOR=0xff137DF8
    ICON=
    ;;
  "Proton Mail")
    ICON=󰇮
    ;;
  "Safari")
    ICON=󰀹
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
  "WezTerm")
    ICON=
    ;;
  "Zed")
    ICON=
    ;;
  "Zed Preview")
    ICON=
    ;;
  "zoom.us")
    ICON=
    ;;
  *)
    INFO="Unknown"
    ICON_COLOR=0xffeba0ac
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
  icon=$ICON icon.color=$ICON_COLOR \
  label="$INFO"

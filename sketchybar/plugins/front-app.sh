ICON_COLOR=0xff89b4fa

case $INFO in
  "Alfred Preferences")
    ICON=󰮤
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
  "VSCodium")
    ICON=󰨞
    ;;
  "Emacs")
    ICON=
    ;;
  "FaceTime")
    ICON=
    ;;
  "Finder")
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
    ICON=
    ;;
  "Proton Mail")
    ICON=󰇮
    ;;
  "Safari")
    ICON=󰀹
    ;;
  "Spotify")
    ICON=
    ;;
  "System Settings")
    ICON=
    ;;
  "TextEdit")
    ICON=
    ;;
  "Vesktop")
    ICON=󰙯
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

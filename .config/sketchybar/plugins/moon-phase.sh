sketchybar --set $NAME \
  label="Loading..." \
  icon.color=0xfff6c177

LOCATION="NewYork"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION?format=j1")

MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')
MOON_ILLUMINATION=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_illumination' | tr -d '"')

case ${MOON_PHASE} in
  "New Moon")
    ICON=
    ;;
  "Waxing Crescent")
    ICON=
    ;;
  "First Quarter")
    ICON=
    ;;
  "Waxing Gibbous")
    ICON=
    ;;
  "Full Moon")
    ICON=
    ;;
  "Waning Gibbous")
    ICON=
    ;;
  "Last Quarter")
    ICON=
    ;;
  "Waning Crescent")
    ICON=
    ;;
esac

sketchybar --set $NAME \
  label="$MOON_ILLUMINATION% $MOON_PHASE" icon=$ICON

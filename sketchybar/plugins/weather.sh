sketchybar --set $NAME \
  label="Loading..." \
  icon.color=0xff89dceb

LOCATION="Orlando"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION?format=j1")

sketchybar --set $NAME label="$LOCATION"

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_F' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{16\}\).*/\1.../')

sketchybar --set $NAME \
  label="$TEMPERATURE$(echo '°')F • $WEATHER_DESCRIPTION"

#!/bin/sh

SPACE_ID=$(yabai -m query --spaces --space | jq -r .index)

sketchybar --set $NAME label=$SPACE_ID

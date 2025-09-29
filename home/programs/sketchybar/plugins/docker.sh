#!/bin/sh

if pgrep -x "OrbStack" > /dev/null; then
  sketchybar --set "$NAME" drawing=on icon="󰡨" label="up" update_freq="60"
else
  sketchybar --set "$NAME" drawing=off update_freq="60"
fi


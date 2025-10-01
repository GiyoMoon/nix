#!/bin/sh

pkill -f "media-control" 2>/dev/null

start_monitor() {
  media-control stream -h 2>/dev/null | while IFS= read -r line; do
    if echo "$line" | grep -q '"playing" :'; then
      IS_PLAYING=$(echo "$line" | sed -E 's/.*"playing" : ?([^,}]+).*/\1/' | tr -d '" ')
      if [ "$IS_PLAYING" = "true" ]; then
        PLAYING_STATUS=true
      elif [ "$IS_PLAYING" = "false" ]; then
        PLAYING_STATUS=false
      fi
    fi

    if echo "$line" | grep -q '"title" : "'; then
      CURRENT_TITLE=$(echo "$line" | sed -E 's/.*"title" : "([^"]+)".*/\1/')
    fi

    if echo "$line" | grep -q '"artist" : "'; then
      CURRENT_ARTIST=$(echo "$line" | sed -E 's/.*"artist" : "([^"]+)".*/\1/')
    fi

    if [ "${PLAYING_STATUS}" = "true" ] && [ -n "$CURRENT_TITLE" ]; then
      sketchybar --set "$NAME" drawing=on icon="" label="$CURRENT_TITLE • $CURRENT_ARTIST" label.max_chars=30 scroll_texts=true scroll_duration=200
    elif [ "${PLAYING_STATUS}" = "false" ]; then
      sketchybar --set "$NAME" drawing=off
    fi
  done &
}

start_monitor
exit 0

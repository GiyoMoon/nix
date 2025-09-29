#!/bin/sh

WG_OUTPUT=$(sudo /Users/jasi/.nix-profile/bin/wg show 2>/dev/null)

if [ -z "$WG_OUTPUT" ]; then
  sketchybar --set "$NAME" drawing=off update_freq="60"
  exit 0
fi

WG_INTERFACE=$(echo "$WG_OUTPUT" | awk '/^interface:/ {print $2; exit}')
PEER_KEY=$(echo "$WG_OUTPUT" | awk '/^peer: / {print $2; exit}')

TUNNEL_NAME="$WG_INTERFACE"
for conf in /etc/wireguard/*.conf; do
  CONFIG_PEER=$(grep -m1 '^PublicKey' "$conf" | awk '{print $3}')

  if [ "$PEER_KEY" = "$CONFIG_PEER" ]; then
    TUNNEL_NAME=$(basename "$conf" .conf)
    break 2
  fi
done

echo "$TUNNEL_NAME"

sketchybar --set "$NAME" drawing=on icon="󰦝" label="$TUNNEL_NAME" update_freq="60"

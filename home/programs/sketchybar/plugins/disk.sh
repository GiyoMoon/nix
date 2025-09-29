#!/bin/sh

sketchybar -m --set "$NAME" icon="" label="$(/Users/jasi/.nix-profile/bin/df -H | grep -E '^(/dev/disk3s3s1)' | awk '{
        gsub(/G$/,"gb",$4);
        printf $4
    }')" update_freq="120"

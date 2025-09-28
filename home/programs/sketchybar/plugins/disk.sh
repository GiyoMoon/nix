#!/bin/sh

sketchybar -m --set "$NAME" icon="" label="$(/Users/jasi/.nix-profile/bin/df -H | grep -E '^(/dev/disk3s3s1)' | awk '{
        u = $5; gsub(/%/,"",u);
        rem = 100 - u; if (rem < 0) rem = 0; if (rem > 100) rem = 100;
        gsub(/G$/,"gb",$4);
        printf "%.0f%% | %s\n", rem, $4
    }')"

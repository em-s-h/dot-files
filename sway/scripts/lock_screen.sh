#!/bin/bash
set -e
sway input "type:keyboard" xkb_switch_layout 0

tmpbg=/tmp/tmp_screen.png
icon=~/pics/pfp/towel.png

grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

swaylock -ufei "$tmpbg" -s fill

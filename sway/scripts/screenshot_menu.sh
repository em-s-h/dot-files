#!/bin/bash

options="1. Screen
2. Window
3. Selection"

input="$(echo -e "$options" | rofi -dmenu -i -l 3 -p 'Capture:')"

file_name="$(rofi -dmenu -p 'File name:')"
path="${HOME}/pics/screenshots/${file_name}.png"
type="${input/[1-9]\. /}"

case "$input" in
    *'1'*)
        grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') "$path"
    ;;
    *'2'*)
        grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" \
            "$path"
    ;;
    *'3'*)
        grim -g "$(slurp)" "$path"
    ;;
    *) exit ;;
esac

[[ $? == 0 ]] && dunstify -u normal -t 4500 "$type captured!" "Saved to $path"
unset options input file_name path

# Emilly S.H. :D

#!/bin/bash
set -e

options="1. Screen
2. Window
3. Selection"

input="$(echo -e "$options" | rofi -dmenu -i -p 'Capture:')"

[[ -z $input ]] && exit
type="${input/[1-9]\. /}"

file=$(date +"%y-%m-%d_%H-%M-%S.png")
path="${HOME}/pics/screenshots/$file"

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

[[ $? -eq 0 ]] && dunstify -u normal -t 4500 "$type captured!" "Saved to $path"

# Emilly S.H. :D

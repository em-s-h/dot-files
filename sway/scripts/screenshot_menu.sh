#!/bin/bash
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

if [[ $? -eq 0 ]]; then
    dunstify -u normal -t 4500 "$type successfully captured!" "Saved to $path"
else
    dunstify -u critical "Error when capturing screenshot"
fi

# Emilly S.H. :D

#!/bin/bash

options="1. Screen
2. Window
3. Selection"

input="$(echo -e "$options" | rofi -dmenu -i -p 'Capture:')"

[[ -z $input ]] && exit

path=~/pics/screenshots/tmp/tmp.png
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

[[ $? -eq 0 ]] && dunstify -u normal -t 3000 "$type captured!" "Temporarily saved to $path"

file_name="$(rofi -dmenu -p 'File name:')"
new_path="${path//tmp*/}${file_name}.png"
mv "$path" "$new_path"

[[ $? -eq 0 ]] && dunstify -u normal -t 4500 "$file_name saved!" "Moved to $new_path"

# Emilly S.H. :D

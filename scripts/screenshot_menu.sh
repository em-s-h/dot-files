#!/bin/bash

options="1. Fullscreen
2. Window
3. Selection"

input="$(echo -e "$options" | rofi -dmenu -i -l 3 -p 'Capture:')"

file_name="$(rofi -dmenu -p 'File name:')"
path="${HOME}/pics/screenshots/${file_name}.png"

case "$input" in
    *'1'*)
        scrot       "$path" &&
        notify-send -u normal -t 4000 "Screen captured!" "Saved to $path"
    ;;
    *'2'*)
        scrot -u    "$path" &&
        notify-send -u normal -t 4000 "Window captured!" "Saved to $path"
    ;;
    *'3'*)
        scrot -s -f "$path" &&
        notify-send -u normal -t 4000 "Selection captured!" "Saved to $path"
    ;;
esac

unset options input file_name path
# Emilly S.H. :D

#!/bin/bash

options="1. Fullscreen
2. Window
3. Selection"

input="$(echo -e "$options" | rofi -dmenu -i -l 3 -p "Capture:")"

case "$input" in
    *'1'*)
        scrot       ~/pics/screenshots/fullscreen_%Y_%m_%d-%H_%M.png &&
        notify-send -u normal -t 2000 "Screen captured!"
    ;;
    *'2'*)
        scrot -u    ~/pics/screenshots/window_%Y_%m_%d-%H_%M.png &&
        notify-send -u normal -t 2000 "Window captured!"
    ;;
    *'3'*)
        scrot -s -f ~/pics/screenshots/selection_%Y_%m_%d-%H_%M.png &&
        notify-send -u normal -t 2000 "Selection captured!"
    ;;
esac

unset options input
# Emilly S.H. :D

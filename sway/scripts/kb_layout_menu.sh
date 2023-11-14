#!/bin/bash

current=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name')
options="1. en_us \n2. pt_br"

input="$(echo -e "$options" | rofi -dmenu -i -l 2 -p "Current ${current}:")"

case "$input" in
    *'1'*) id=0
    ;;
    *'2'*) id=1
    ;;
    *) exit ;;
esac

sway input "type:keyboard" xkb_switch_layout $id

unset options lang input

# Emilly S.H. :D

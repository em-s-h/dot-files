#!/bin/bash
set -e

current=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name')

input="$(echo -e "1. en_us \n2. pt_br" | rofi -dmenu -i -p "Current ${current}:" | cut -c -1)"

if [[ $input -eq 1 ]]; then
    id=0
elif [[ $input -eq 2 ]]; then
    id=1
fi

sway input "type:keyboard" xkb_switch_layout $id

# Emilly M.S.H

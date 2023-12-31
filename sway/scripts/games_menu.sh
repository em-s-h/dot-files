#!/bin/bash 

cd ~/games

game="$(ls | sed "s/\.desktop//g" | rofi -dmenu -i -p "Games:").desktop"
dex --term kitty "$game"

if [[ $game = *"Half-Life 2"* ]]; then
    sway input "type:keyboard" xkb_options "caps:capslock"
fi

# Emilly S.H. :D

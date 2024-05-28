#!/bin/bash 
set -e

cd ~/games

game="$(ls *.desktop | sed "s/\.desktop//g" | rofi -dmenu -i -p "Play:").desktop"
dex --term kitty "$game"

if [[ $game =~ ".*Half-Life 2.*" ]]; then
    sway input "type:keyboard" xkb_options "caps:capslock"
fi

# Emilly M.S.H

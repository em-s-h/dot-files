#!/bin/bash 

out=$(pgrep -cx gammastep)

if [[ $out -ge 1 ]]; then
    pkill -x gammastep
else
    sway "exec gammastep -r"
fi

pkill -SIGRTMIN+8 waybar

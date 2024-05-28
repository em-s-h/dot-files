#!/bin/bash 
set -e

IFS=$'\n' outputs=($(wpctl status -n | grep alsa_output | sed "s/\[.*//"))

current=$(xargs <<< "${outputs[-1]}")
unset "outputs[-1]"

if [[ $current =~ "hdmi" ]]; then
    current="HDMI"
elif [[ $current =~ "analog" ]]; then
    current="Speakers"
fi

input="$(echo -e "1. Speakers \n2. HDMI" | rofi -dmenu -i -p "Current $current:" | cut -c -1)"
if [[ $input -eq 1 ]]; then
    input="analog"
elif [[ $input -eq 2 ]]; then
    input="hdmi"
fi
id=0

for out in "${outputs[@]}"; do
    if [[ $out =~ $input ]]; then
        id=$(cut -c 11- <<< "$out" | cut -c -2)
    fi
done

wpctl set-default "$id"

# Emilly M.S.H

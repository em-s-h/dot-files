#!/bin/bash

options="󰅖 - No \n - Yes, $1"

input="$(echo -e "$options" | rofi -dmenu -i -p "Are you sure you want to $1?")"

if [[ $input = *Yes* ]]; then
    echo "yes"
else
    exit
fi

unset options input

# Emilly S.H. :D

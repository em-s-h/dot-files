#!/bin/bash
set -e

options="󰅖 - No \n - Yes, $1"

input="$(echo -e "$options" | rofi -dmenu -i -p "Are you sure you want to $1?")"

if [[ $input = *Yes* ]]; then
    echo "yes"
else
    exit
fi

# Emilly S.H. :D

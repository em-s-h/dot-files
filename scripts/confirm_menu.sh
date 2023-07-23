#!/bin/bash

options="󰅖 - No \n - Yes, $1"

input="$(echo -e "$options" | rofi -dmenu -i -p "Are you sure you want to $1?")"

if [[ $input = *No* ]] ; then
    exit 0
#
elif [[ $input = *Yes* ]]; then
    echo "yes"
fi

# Emilly S.H. :D

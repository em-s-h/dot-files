#!/bin/bash
set -e

options="󰅖 - No \n - Yes, $1"

input="$(echo -e "$options" | rofi -dmenu -i -p "Are you sure you want to $1?")"

[[ $input =~ "Yes" ]] && echo "yes"

# Emilly M.S.H

#!/bin/bash

options="󰅖 - No \n - Yes, $1"
input="/tmp/dmenu-input"

echo -e "$options" | rofi -dmenu -i -l 2 -p "Are you sure you want to $1?" > "$input"

input="$(cat $input)"

if [[ $input = *No* ]] ; then
    exit 0
fi

case "$1" in
    *'suspend'*) systemctl suspend
    ;;
    *'log'*) i3-msg exit
    ;;
    *'reboot'*) systemctl reboot
    ;;
    *'poweroff'*) systemctl poweroff
    ;;
esac

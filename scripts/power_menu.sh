#!/bin/bash

options="1. 󰅖 - Close menu \n2.  - Lock screen \n3. ⏾ - Suspend \n4. 󰍃 - Log out \n5.  - Reboot \n6. 󰐥 - Poweroff"
input="/tmp/dmenu-input"

echo -e "$options" | rofi -dmenu -i -l 6 -p "Power options:" > "$input"

input="$(cat $input)"

case "$input" in
    *'1'*) exit 0 
    ;;
    *'2'*) ~/dev/scripts/screen_lock.sh
    ;;
    *'3'*) ~/dev/scripts/confirm_menu.sh "suspend the computer"
    ;;
    *'4'*) ~/dev/scripts/confirm_menu.sh "log out of i3"
    ;;
    *'5'*) ~/dev/scripts/confirm_menu.sh "reboot the computer"
    ;;
    *'6'*) ~/dev/scripts/confirm_menu.sh "poweroff the computer"
    ;;
esac

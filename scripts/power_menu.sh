#!/bin/bash

options="1. 󰅖 Close menu
2.  Lock screen
3. ⏾ Suspend
4. 󰍃 Log out
5.  Reboot
6. 󰐥 Poweroff"

input="$(echo -e "$options" | rofi -dmenu -i -l 6 -p "Power options:")"

case "$input" in
    *'1'*) exit 0 
    ;;
    *'2'*) ~/dev/scripts/lock_screen.sh
    ;;
    *'3'*) ~/dev/scripts/lock_screen.sh && systemctl suspend
    ;;
    *'4'*)
        input=$(~/dev/scripts/confirm_menu.sh "log out of i3");
        if [[ $input == "yes" ]]; then
            i3-msg exit
        fi
    ;;
    *'5'*)
        input=$(~/dev/scripts/confirm_menu.sh "reboot the computer");
        if [[ $input == "yes" ]]; then
            systemctl reboot
        fi
    ;;
    *'6'*)
        input=$(~/dev/scripts/confirm_menu.sh "poweroff the computer");
        if [[ $input == "yes" ]]; then
            systemctl poweroff
        fi
    ;;
esac

unset options input

# Emilly S.H. :D

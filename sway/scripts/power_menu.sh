#!/bin/bash

cd ~/.config/sway/scripts

options="1. 󰅖 Close menu
2.  Lock screen
3. ⏾ Suspend
4. 󰍃 Log out
5.  Reboot
6. 󰐥 Poweroff"

input="$(echo -e "$options" | rofi -dmenu -i -l 6 -p "Power options:")"

case "$input" in
    *'2'*) ./lock_screen.sh
    ;;
    *'3'*) ./lock_screen.sh && sudo systemctl suspend
    ;;
    *'4'*)
        input=$(./confirm_menu.sh "log out of i3");
        [[ $input == "yes" ]] && swaymsg exit
    ;;
    *'5'*)
        input=$(./confirm_menu.sh "reboot the computer");
        [[ $input == "yes" ]] && sudo reboot
    ;;
    *'6'*)
        input=$(./confirm_menu.sh "poweroff the computer");
        [[ $input == "yes" ]] && sudo poweroff
    ;;
    *) exit ;;
esac

unset options input

# Emilly S.H. :D

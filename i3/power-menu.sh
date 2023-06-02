#!/bin/bash

options=" - Lock screen \n⏾- Suspend \n󰍃 - Log out \n - Reboot \n󰐥 - Poweroff"
input_file="/tmp/dmenu-input"

echo -e "$options" | rofi -dmenu -i -l 5 -p "Power options" > "$input_file"

if  grep -q -i "lock" "$input_file" ; then
    ~/.config/i3/screen-lock.sh

elif  grep -q -i "suspend" "$input_file" ; then
    systemctl suspend

elif  grep -q -i "log" "$input_file" ; then
    i3-nagbar -t warning -m "Are you sure you want to exit i3?" -B "Yes, exit i3" "i3-msg exit"

elif  grep -q -i "reboot" "$input_file" ; then
    i3-nagbar -t warning -m "Are you sure you want to reboot your computer?" -B "Yes, reboot" "systemctl reboot"

elif  grep -q -i "poweroff" "$input_file"; then
    i3-nagbar -t warning -m "Are you sure you want to poweroff your computer?" -B "Yes, poweroff" "systemctl poweroff"
fi

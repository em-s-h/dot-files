#!/bin/bash

options=" - Portuguese (Brasil, no dead keys) \n - Portuguese (Brasil)"
input_file="/tmp/dmenu-input"

echo -e "$options" | rofi -dmenu -i -l 2 -p "Keyboard layout:" > "$input_file"

if  grep -qi "dead" "$input_file" ; then
    setxkbmap -layout 'br(nodeadkeys)'
#
elif  grep -qi "brasil" "$input_file" ; then
    setxkbmap -layout 'br'
fi

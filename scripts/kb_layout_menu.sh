#!/bin/bash

options="1.  - Portuguese (Brasil) \n2.  - Portuguese (Brasil, no dead keys)"
input="/tmp/dmenu-input"

echo -e "$options" | rofi -dmenu -i -l 2 -p "Keyboard layout:" > "$input"

input="$(cat $input)"

case "$input" in
    *'1'*) setxkbmap -layout 'br' -option 'caps:swapescape'
    ;;
    *'2'*) setxkbmap -layout 'br(nodeadkeys)' -option 'caps:swapescape'
    ;;
esac

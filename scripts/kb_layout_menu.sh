#!/bin/bash

options="1.  - Portuguese (Brasil)
2.  - Portuguese (Brasil, no dead keys)
3.  - "

input="$(echo -e "$options" | rofi -dmenu -i -l 3 -p "Keyboard layout:")"

case "$input" in
    *'1'*) setxkbmap -layout 'br' -option 'caps:swapescape'
    ;;
    *'2'*) setxkbmap -layout 'br(nodeadkeys)' -option 'caps:swapescape'
    ;;
    *'3'*) echo "In dev"
    ;;
esac

# Emilly S.H. :D

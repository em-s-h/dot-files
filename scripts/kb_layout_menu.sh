#!/bin/bash

options="1. en_us \n2. pt_br"
lang=""

input="$(echo -e "$options" | rofi -dmenu -i -l 2 -p "Keyboard layout:")"

case "$input" in
    *'1'*) lang='us'
    ;;
    *'2'*) lang='br'
    ;;
esac

setxkbmap -layout "$lang" -option "caps:swapescape"

unset options lang input

# Emilly S.H. :D

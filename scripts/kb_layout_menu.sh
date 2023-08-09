#!/bin/bash

options="1. pt_br \n2. en_us"
lang=""

input="$(echo -e "$options" | rofi -dmenu -i -l 2 -p "Keyboard layout:")"

case "$input" in
    *'1'*) lang='br'
    ;;
    *'2'*) lang='us'
    ;;
esac

setxkbmap -layout "$lang" -option "caps:swapescape"

unset options lang input

# Emilly S.H. :D

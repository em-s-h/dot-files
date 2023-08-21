#!/usr/bin/env bash

tmpbg="$HOME/pics/screenshots/screen.png"
icon="$HOME/pics/pfp/towel.png"

scrot -q1 -o "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg" 
rm "$tmpbg"

unset tmpbg icon

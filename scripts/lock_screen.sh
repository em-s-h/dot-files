#!/usr/bin/env bash

tmpbg="$HOME/media/screenshots/screen.png"
icon="$HOME/media/pfp/towel.png"

scrot -q1 -o "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg" 
rm "$tmpbg"

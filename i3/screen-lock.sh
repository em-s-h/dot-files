#!/usr/bin/env bash

icon="$HOME/media/pfp/towel.png"
tmpbg="$HOME/media/screenshots/screen.png"

scrot "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg" 
rm "$tmpbg"

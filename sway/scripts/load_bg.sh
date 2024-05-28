#!/bin/bash
set -e

if pgrep swaybg; then
    killall -q swaybg
fi

cd ~/pics/wallpapers

prev_bg=$(( $(< .prev_bg) ))
new_bg=$(( $prev_bg + 1 ))

max_bg=$(( $(ls . | tail -n 1 | sed "s/-.*//") ))

if [[ $new_bg -gt $max_bg ]]; then
    new_bg=1
fi
echo "$new_bg" >| .prev_bg

if [[ $new_bg -lt 10 ]]; then
    new_bg="0$new_bg"
fi
new_bg=$(ls . | grep -E "^${new_bg}-")

echo "$(date +'%Y_%m_%d') - $new_bg" >> ~/.logs/load_bg.log
swaybg -i "$new_bg" -m fill &

# Emilly M.S.H

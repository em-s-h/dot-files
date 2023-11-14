#!/bin/bash

[[ ! -f /tmp/rand-bg-loaded ]] && touch /tmp/rand-bg-loaded

killall -q swaybg
swaybg -i $(find ~/pics/wallpapers/ -type f | shuf -n1) -m fill &

# Emilly S.H. :D

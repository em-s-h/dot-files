#!/bin/bash

output=./playlist.m3u
printf "" > "$output"

for f in *.mp3; do
    if [[ $f != old* ]]; then
        echo "$f" >> "$output"
    fi
done

#!/bin/bash

input="$1"

if [[ ! $input = [yY]* ]] ; then
    read -p "Do you wish to see today's weather? (y/n): " input
fi

if [[ $input = [yY]* ]] ; then
    curl wttr.in
    sleep 1
fi

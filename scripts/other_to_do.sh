#!/bin/bash

input="$1"

if [[ $input = ask ]] ; then
    read -p "Do you wish to see other stuff to-do? (y/n): " input
else
    input='y'
fi

if [[ $input = [yY]* ]] ; then
    cd ~/notes/to_dos/

    glow
    cd - > /dev/null
fi

# Emilly S.H. :D

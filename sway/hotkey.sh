#!/bin/bash

#/usr/include/linux/input-event-codes.h
#KEY_*
#1 - down ; 0 - up

cont_file=/tmp/hotkey_continue
echo 1 >| $cont_file

while $(grep -q 1 $cont_file) ; do
    ydotool click -D 120 0x40
    ydotool click -D 120 0x80
done

ydotool click 0x40
ydotool click 0x80


#!/bin/bash

echo "$ret"

ret="$?"

echo "$ret"

if [[ $ret != 0 ]]; then
    printf "[$ret] "
fi

#!/bin/bash 

out=$(pgrep -cx gammastep)

if [[ $out -ge 1 ]]; then
    txt='󰌶'
    tooltip="gammastep on"
    class='on'
else
    txt='󰌵'
    tooltip="gammastep off"
    class='off'
fi

echo "{
    \"text\": \"$txt\",
    \"tooltip\": \"$tooltip\",
    \"class\": \"$class\"
}" | jq --unbuffered --compact-output

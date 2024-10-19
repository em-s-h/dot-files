#!/bin/bash 

installed=$(pacman -Q linux | sed "s/[ linux\.-]//g")
current=$(uname -r | sed "s/[ linux\.-]//g")

if [[ $installed =~ $current ]]; then
    txt=""
    mssg="linux is up to date."
    class="ok"
else
    txt="!  !"
    mssg="linux is out of date!"
    class="critical"
fi

echo "{
    \"text\": \"$txt\",
    \"tooltip\": \"$mssg\",
    \"class\": \"$class\"
}" | jq --unbuffered --compact-output

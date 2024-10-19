#!/bin/bash 

total=$(zramctl -no TOTAL | xargs)

ram=$(awk '/MemTotal/ { printf "%i\n", $2*1024 }' /proc/meminfo)
compr=$(zramctl -bno COMPR | xargs)

percent=$(echo "($compr / $ram) * 100" | bc)
percent=${percent//.*/}

if [[ -z $percent ]]; then
    percent=0
fi

echo "{
    \"text\": \"zrm: $percent%\",
    \"tooltip\": \"Total: $total\"
}" | jq --unbuffered --compact-output

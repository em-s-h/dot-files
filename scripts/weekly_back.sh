#!/bin/bash

back_fail() {
    if [[ $? != 0 ]]; then
        echo
        echo "Backup failed at $(date +"%T")."

        echo "/***********************************************************\\"
        echo
        exit 1
    fi
}
date=$(date +"%d_%m_%y")

echo
echo "\\***********************************************************/"

echo "Starting weekly backup at $(date +"%d/%m/%y - %T")."
echo

declare -a names=("notes")
declare -a files=(~/notes)

for (( i=0; i<${#names[@]}; i++ )); do
    name="${names[$i]}"

    mkdir -p "$HOME/backups/$name/$date"
    cd "$HOME/backups/$name/$date"

    time tar -cpvJf $name.tar.xz --exclude-vcs ${files[$i]}
    back_fail
done

echo
echo "Files were successfully backed up at $(date +"%T")!"

unset names
unset files
unset date

echo "/***********************************************************\\"
echo

# Emilly S.H. :D

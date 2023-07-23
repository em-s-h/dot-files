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

notify-send --urgency=normal --expire-time=6000 "Beggining monthly backup!"
echo "Starting weekly backup at $(date +"%d/%m/%y - %T")."
echo

declare -a names=("home" "usr_bin")
declare -a files=(/home/esh /usr/bin)

for (( i=0; i<${#names[@]}; i++ )); do
    name="${names[$i]}"

    mkdir -p "$HOME/backups/$name/$date"
    cd "$HOME/backups/$name/$date"

    time tar -cpvJf $name.tar.xz --exclude=*tmp* --exclude=*temp/* --exclude=*debug* --exclude=*backup* --exclude=*.import* \
        --exclude=*demo* --exclude=*Debug* --exclude=*Trash* --exclude-backups --exclude-caches-under --exclude-vcs \
        --exclude=*.godot* --exclude=*/retroarch/* --exclude=*git-repos* --exclude=*/.cache/* --exclude=*VirtualBox* \
        --exclude=*mason* --exclude=*packer* --exclude=*dreamcast* --exclude=*gamecube* --exclude=*xbox_360* \
        --exclude=*ps2* ${files[$i]}

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

#! /bin/bash

echo
echo "\\***********************************************************/"

echo "Starting backup of my notes at $(date +"%d/%m/%y - %T")."
echo

cd ~/.backups/ || \
{
    echo;
    echo "Error, folder not found.";
    echo "Backup failed at $(date +"%T").";

    echo "/***********************************************************\\";
    echo;
    exit 1;
}

7z a notes-new.7z ~/notes/ 2>error.txt

if [ -f error.txt ]; then
    while IFS= read -r line
    do
        if [[ "${line}" == *"WARNING"* ]] ; then
            echo
            echo "Backup failed at $(date +"%T")."

            echo "/***********************************************************\\"
            echo

            rm notes-new.7z
            rm error.txt
            exit 1
        fi
    done < error.txt
    rm error.txt
fi

if [ -f notes.7z ] ; then
    echo
    echo "Removing old backup..."
    rm notes.7z
fi

mv notes-new.7z notes.7z

echo
echo "Files were successfully backed up at $(date +"%T")!"

echo "/***********************************************************\\"
echo

# Emilly S.H. :D

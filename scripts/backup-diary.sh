#! /bin/bash

echo
echo "\\***********************************************************/"

echo "Starting backup of diary at $(date +"%d/%m/%y - %T")."
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

7z a diary-new.7z ~/documents/diary/ 2> error.txt

if [ -f error.txt ]; then
    while IFS= read -r line
    do
        if [[ "${line}" == *"WARNING"* ]] ; then
            echo
            echo "Backup failed at $(date +"%T")."

            echo "/***********************************************************\\"
            echo

            rm diary-new.7z
            rm error.txt
            exit 1
        fi
    done < error.txt
    rm error.txt
fi

if [ -f diary.7z ] ; then
    echo
    echo "Removing old backup..."
    rm diary.7z
fi

mv diary-new.7z diary.7z

echo
echo "Files were successfully backed up at $(date +"%T")!"

echo "/***********************************************************\\"
echo

# Emilly S.H. :D

#!/bin/bash

cd ~/apps/

echo '- Backing up previous version -'
tar cJf ppsspp.tar.xz ppsspp/
mv ppsspp.tar.xz ~/backups/other/
trash ppsspp/

cd ~/git-repos/ppsspp/

echo -e '\n- Downloading newer version -'
git pull --rebase https://github.com/hrydgard/ppsspp.git && git submodule update --init --recursive

[[ $? != 0 ]] && exit 1

mkdir build/
cd build/

echo -e '\n- Building PPSSPP -'
cmake -S .. -B . && make -j 4 

if [[ $? != 0 ]]; then
    notify-send -t 500000 -u critical "PPSSPP build failed!"
    echo -e '\n- PPSSPP build failed! -'
    exit 1
fi

cd ..
mv build/ ~/apps/ppsspp/

echo -e '\n- Done! -'
exit 0

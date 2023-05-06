#!/bin/bash

if [ ! -d ~/.emilly ]; then
    printf "Home PC not loading configuration.\n"
    exit 0
fi

if [ -f /tmp/config-loaded ]; then
    printf "Configuration is already loaded.\n"
    exit 0
fi

printf "Loading configuration...\n"
echo

curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

cp ~/.emilly/config-files/.bash_aliases ~/.bash_aliases
cp ~/.emilly/config-files/.clang-format ~/

cp -r ~/.emilly/config-files/terminal ~/.config/xfce4/
cp -r ~/.emilly/config-files/nvim/ ~/.config/

touch /tmp/config-loaded
printf "All done!\n"

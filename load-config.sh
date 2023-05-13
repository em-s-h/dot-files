#!/bin/bash

if [ -d /home/esh ]; then
    printf "Home PC not loading configuration.\n"
    exit 0
fi

if [ -f /tmp/dot-loaded ]; then
    printf "Configuration is already loaded.\n"
    exit 0
fi

printf "Loading configuration...\n"
echo

# curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

cp ~/.emilly/dot-files/.bash_aliases ~/.bash_aliases
cp ~/.emilly/dot-files/.clang-format ~/

rm -fr ~/.config/xfce4/terminal
rm -fr ~/.config/nvim

cp -r ~/.emilly/dot-files/terminal ~/.config/xfce4/
cp -r ~/.emilly/dot-files/nvim/ ~/.config/

touch /tmp/dot-loaded
printf "All done!\n"

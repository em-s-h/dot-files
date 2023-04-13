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

cp ~/.emilly/config-files/.bash_aliases ~/.bash_aliases
cp ~/.emilly/config-files/.clang-format ~/.emilly/

cp ~/.emilly/config-files/editor_settings-4.tres ~/.config/godot/
cp -r ~/.emilly/config-files/terminal ~/.config/xfce4/

cp -r ~/.emilly/config-files/nvim/ ~/.config/
cp ~/.emilly/config-files/krita* ~/.config/

if [ ! -f ~/.emilly/apps/gdvim.sh ]; then
    mv ~/.emilly/config-files/gdvim.sh ~/.emilly/apps/
fi

touch /tmp/config-loaded
printf "All done!\n"

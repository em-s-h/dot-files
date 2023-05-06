#!/bin/bash

cd ~/git-repos/config-files/ || { printf "Git repo not found!\n"; exit 1; }

printf "Copying files...\n"

cp -r ~/.config/xfce4/terminal/ .
cp -r ~/.config/nvim/ .
cp ~/.clang-format .

printf "Done!\n"
echo

printf "Adapting config files for use in school PC labs...\n"

sed -i "s/esh/aluno/" ./nvim/lua/esh/plugins/lsp/lspconfig.lua
sed -i "/gitignore/d" ./nvim/lua/esh/plugins/treesitter.lua

printf "Done!\n"

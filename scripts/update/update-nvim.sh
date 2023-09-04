#!/bin/bash

cd ~/apps/

echo '- Downloading newer version -'
curl -O -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz.sha256sum
curl -O -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

echo -e '\n- Verifying sha256sum -'
sha256sum -c nvim-linux64.tar.gz.sha256sum || exit 1

echo -e '\n- Backing up previous version -'
tar cJf nvim_back.tar.xz nvim/ || exit 1
mv nvim.tar.xz ~/backups/other/
trash nvim/

echo -e '\n- Extracting newer version -'
tar xzf nvim-linux64.tar.gz || exit 1
mv nvim-linux64/ nvim/

echo -e '\n- Copying man page -'
cp nvim/man/man1/nvim.1 ~/.local/man/man1/

echo -e '\n- Removing archive and sha256sum -'
trash nvim-linux64.tar.gz*

echo -e '\n- Done! -'
exit 0

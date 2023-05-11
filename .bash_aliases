# Apply wallpaper.
xfconf-query -c xfce4-desktop \
    -p /backdrop/screen0/monitorVGA-0/workspace0/last-image \
    -s ~/.emilly/media/wallpaper.png

# Other.
~/.emilly/config-files/load-config.sh
setxkbmap -option "caps:escape"
set -o vi

export VISUAL="nvim -u ~/.config/nvim/vim-init.lua"
export EDITOR="$VISUAL"

export BASH_ENV="$HOME/.bashenv"
. "$HOME/.cargo/env"

alias vim='nvim -u ~/.config/nvim/vim-init.lua'

# ls aliases.
alias la='ls -lha'
alias l='ls -lh'

# Other aliases.
alias rm='rm -i'
alias c='clear'
alias q='exit'
alias x='exit'


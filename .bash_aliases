# Apply wallpaper.
xfconf-query -c xfce4-desktop \
    -p /backdrop/screen0/monitorVGA-1/workspace0/last-image \
    -s ~/.emilly/media/wallpaper.png

# Other.
~/.emilly/config-files/load-config.sh
setxkbmap -option "caps:swapescape"

# vim.
alias gdvim='nvim --listen ~/.cache/nvim/godot.pipe .'  # For Godot.
alias vim='nvim -u ~/.config/nvim/alt-ini.lua'          # Minimal nvim config.

# ls aliases.
alias la='ls -lha'
alias l='ls -lh'

# Other aliases.
alias tab='xfce4-terminal --tab'
alias c='clear'
alias q='exit'
alias x='exit'

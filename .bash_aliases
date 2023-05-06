# Apply wallpaper.
xfconf-query -c xfce4-desktop \
    -p /backdrop/screen0/monitorVGA-1/workspace0/last-image \
    -s ~/.emilly/media/wallpaper.png

# Other.
~/.emilly/config-files/load-config.sh
etxkbmap -option "caps:swapescape"

# ls aliases.
alias la='ls -lha'
alias l='ls -lh'

# Other aliases.
alias c='clear'
alias q='exit'
alias x='exit'

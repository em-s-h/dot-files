# ~/.bash_aliases

# General
alias test_net='ping 1.1.1.2 -a'
alias weather='curl wttr.in'
alias dir='echo "Fuck Windows"'

# Color
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Utils
alias la='ls -aoph --time-style="+%y-%m-%d %H:%M"'
alias l='ls -oph --time-style="+%y-%m-%d %H:%M"'

alias du='du -sh'
alias rm='rm -i'
alias df='df -h'
alias c='clear.sh'
alias x='. exit.sh'

# Pacman
alias pacupdate='sudo pacman -Syu'

# Apps
alias yt-play='yt-dlp -i -w -f mp4 -o "%(playlist_index)s - %(title)s.%(ext)s"'
alias bvim='/usr/bin/vim'

alias vi='nvim -u ~/.config/nvim/vi_init.lua --noplugins'
alias vim='nvim -u ~/.config/nvim/vim_init.lua'

alias gitcom='git add . && git commit'
alias icat='kitty +kitten icat'
alias python='python3'
alias xdelta='xdelta3'

alias duckstation='duckstation-qt'
alias pcsx2='pcsx2-qt'


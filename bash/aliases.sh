# ~/.bash_aliases

# General
alias reset_net='sudo systemctl restart systemd-resolved.service systemd-networkd.service'
alias test_net='ping 1.1.1.2 -a'
alias weather='curl wttr.in'
alias dir='echo "This is not Windows"'

# Color
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Utils
alias stop='kill -s sigstop'
alias cont='kill -s sigcont'

alias la='ls -alph --time-style="+%Y/%m/%d %H:%M"'
alias l='ls -lph --time-style="+%Y/%m/%d %H:%M"'

alias rm='rm -i'
alias df='df -h'
alias c='clear;tsk'
alias x='exit'

# Apps
alias yt-play='yt-dlp -i -w -f mp4 -o "%(playlist_index)s - %(title)s.%(ext)s"'
alias bvim='/usr/bin/vim'

alias vi='nvim -u ~/.config/nvim/vi_init.lua --noplugins'
alias vim='nvim -u ~/.config/nvim/vim_init.lua'

alias git-pu='git add . && git commit && git push -u origin main'
alias icat='kitty +kitten icat'
alias python='python3'
alias xdelta='xdelta3'

alias duckstation='duckstation-qt'
alias pcsx2='pcsx2-qt'


# ~/.bash_aliases

# App aliases.
alias  vi='nvim -u ~/.config/nvim/vi_init.lua --noplugins'
alias vim='nvim -u ~/.config/nvim/vim_init.lua'

alias yt-mp3='yt-dlp -x --audio-format mp3 --audio-quality 0 -o'
alias yt-mp4='yt-dlp -f mp4 -o'

alias shatteredPD='java -jar ~/games/shatteredPD.jar'
alias plantuml='java -jar ~/apps/plantuml.jar'
alias icat='kitty +kitten icat'

alias python='python3'
alias xdelta='xdelta3'
alias pip='pip3'

# ls aliases.
alias lai='ls -alph --color=auto -I "$(cat .ignore 2> /dev/null)" -I "$(cat .gitignore 2> /dev/null)"'
alias  li='ls -lph  --color=auto -I "$(cat .ignore 2> /dev/null)" -I "$(cat .gitignore 2> /dev/null)"'
alias  la='ls -alph --color=auto'
alias   l='ls -lph  --color=auto'

# Other aliases.
alias dir='echo "This is not Windows"'
alias test_net='ping 8.8.8.8 -a'
alias weather='curl wttr.in'
alias cal='ncal -b'

alias where='whereis'
alias rm='rm -i'
alias c='clear'
alias x='exit'

# Commands to run in interactive sessions can go here
if status is-interactive
    bash -i ~/.init-ssh

    clear
    cd "$HOME/notes/"

    glow ./to-do.md
    cd - > /dev/null

    setxkbmap -option "caps:swapescape"

    set -x VISUAL "nvim -u $HOME/.config/nvim/vim-init.lua"
    set -x EDITOR "$VISUAL"

    set -x BASH_ENV "$HOME/.bashenv"

    set -g fish_greeting 
end

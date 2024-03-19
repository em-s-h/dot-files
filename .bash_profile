#
# ~/.bash_profile
#

[[ -d ~/.dotnet/tools ]] && PATH="$HOME/.dotnet/tools:$PATH"
[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d ~/.cargo/bin ]] && PATH="$HOME/.cargo/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

read -p "Start $(tput setaf 6)sway$(tput sgr0)? (y/n) " input
[[ $(tty) = *tty1 && $input = [yY]* ]] && exec sway

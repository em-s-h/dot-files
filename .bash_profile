#
# ~/.bash_profile
#

[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d ~/.dotnet/tools ]] && PATH="$HOME/.dotnet/tools:$PATH"
[[ -d ~/.cargo/bin ]] && PATH="$HOME/.cargo/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

read -p "Start sway? (y/n) " input
[[ $(tty) = *tty1 && $input = [yY]* ]] && exec sway

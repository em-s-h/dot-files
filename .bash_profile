#
# ~/.bash_profile
#

[[ -d ~/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d ~/.dotnet/tools ]] && PATH="$HOME/.dotnet/tools:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ "$(tty)" = *"tty1" ]] && exec sway

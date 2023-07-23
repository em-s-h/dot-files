# ~/.bashrc

# Main. {{{
# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
. ~/.bash_aliases

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion

  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# }}}

# Variables. {{{
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Set history length.
HISTFILESIZE=2000
HISTSIZE=1000

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export BASH_ENV="$HOME/.bashenv"

export VISUAL="nvim -u $HOME/.config/nvim/vim_init.lua"
export EDITOR="nvim"

. "$HOME/.local/kitty.app/lib/kitty/shell-integration/bash/kitty.bash"
. "$HOME/.cargo/env"
# }}}

# Prompt. {{{
# Set chroot variable for prompt.
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# PS1='${debian_chroot:+($debian_chroot)}' for chroot in prompt

# PS1='\[\e[30;48;5;81;1m\] $(spwd) \[\e[0;38;5;81;48;5;86m\]\[\e[30;1m\] \u \[\e[0;38;5;86;48;5;140m\]\[\e[30;1m\] \$ \[\e[0;38;5;140m\] \[\e[0m\]'
# PS1='\[\e[30;48;5;81;1m\] $(spwd) \[\e[0;38;5;81;48;5;86m\]\[\e[30;1m\] \u \[\e[0;38;5;86;48;5;140m\]\[\e[30;1m\] \$ \[\e[0;38;5;140m\] \[\e[0m\]'

PS1='\[\e[38;5;92m\]\[\e[97;48;5;92m\] $(spwd) \[\e[0;38;5;92m\] \[\e[38;5;99m\]\u\[\e[38;5;171m\]\$ \[\e[0m\]'
# }}}

# shopt. {{{
shopt -s checkwinsize
shopt -s histappend
shopt -s globstar
shopt -s cdspell
shopt -s autocd
# }}}

# Welcome. {{{
term_count=$(ls /dev/pts/ | grep -ve '[[:alpha:]]' | wc -l)

if grep -iq '"done": true' ~/.config/please/config.json ; then
    please clean
else
    please
fi

if [[ $term_count -le 2 ]]; then
    red='\033[0;31m'
    nc='\033[0m'

    echo -e "${red} ! READ THE TO-DO LIST ! ${nc}"
    sleep 2
    ~/dev/scripts/other_to_do.sh

    # ssh agent. {{{
    env=~/.ssh/agent.env

    agent_load_env () {
        test -f "$env" && . "$env" >| /dev/null ;
    }

    agent_start () {
        (umask 077; ssh-agent >| "$env")
        . "$env" >| /dev/null ;
    }
    agent_load_env

    # agent_run_state: 0 agent running w/ key; 1 agent w/o key; 2 agent not running.
    agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        agent_start
        ssh-add

    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        ssh-add
    fi
    # }}}
    unset env nc red
fi
unset term_count
# }}}

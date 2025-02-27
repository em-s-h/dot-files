# |------------------------------------------|
# | This file is autogenerated. Do not edit! |
# |------------------------------------------|
# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Make less more friendly for non-text input files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support
[[ -x /usr/bin/dircolors ]] && eval "$(dircolors -b)"

# Clear history after exiting {{{
clr_hist() {
    clear
    reset
    history -c
    history -w
}

trap clr_hist EXIT
# }}}

# Sourcing {{{
# Git prompt
[[ -f ~/.config/bash/git-prompt.sh ]] && . ~/.config/bash/git-prompt.sh

# Functions
[[ -f ~/.config/bash/functions.sh ]] && . ~/.config/bash/functions.sh

# Aliases
[[ -f ~/.config/bash/aliases.sh ]] && . ~/.config/bash/aliases.sh

# Completions
if [[ -d ~/.config/bash/completions ]]; then
    for f in ~/.config/bash/completions/*; do
        . "$f"
    done
fi

# Command not found
. /usr/share/doc/pkgfile/command-not-found.bash
# }}}

# Variables {{{
# man terminfo
export BLA=$(tput setaf 0) # Black
export RED=$(tput setaf 1) # Red
export GRE=$(tput setaf 2) # Green
export YEL=$(tput setaf 3) # Yellow
export BLU=$(tput setaf 4) # Blue
export MAG=$(tput setaf 5) # Magenta
export CYA=$(tput setaf 6) # Cyan
export WHI=$(tput setaf 7) # White

export BOL=$(tput bold)    # Bold
export ITA=$(tput sitm)    # Italic
export UL=$(tput smul)     # Underline
export NC=$(tput sgr0)     # No color & format

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Set history length.
HISTFILESIZE=2000
HISTSIZE=1000

# Setup defaults to bc
export BC_ENV_ARGS="/home/esh/.config/bc/setup"

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export EDITOR="nvim -u ~/.config/nvim/vi_init.lua --noplugins"
export VISUAL="nvim -u ~/.config/nvim/vim_init.lua"
export SUDO_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"
# }}}

# Prompt {{{
# Workaround to maintain the exit code of the terminal cmd
_pwd() {
    # {{{
    local exit_c=$?
    printf "{${CYA}${ITA}$(spwd)${NC}${BLU}}"
    $(exit ${exit_c})
}
# }}}

_branch() {
    # {{{
    local branch=$(__git_ps1 "%s")
    if [[ -z $branch ]]; then
        printf "${BLA}null"
    else 
        printf "${BLU}$branch"
    fi
}
# }}}

_job() {
    # {{{
    local jbs=$(jobs | wc -l)
    if [[ $jbs -gt 0 ]]; then
        printf "($GRE ${jbs}j ${MAG})"
    else
        printf "${MAG}-"
    fi
}
# }}}

PS1='\[$BLU\]┌\[$(_pwd)\] \[$(_job)\] git\[$WHI\]:\[$(_branch)\] \n\[$NC$BLU\]} \[$CYA\]\! \[$MAG\]\$ \[$NC\]'

# Old prompts
#                 r   g   b
# PS1=' \[\e[38;2;148;0;211m\]\[\e[97;48;2;148;0;211m\] $(spwd) \[\e[0;38;2;148;0;211m\] \[\e[38;2;131;111;255m\]\u\[\e[38;2;224;102;255m\]\$ \[\e[0m\]'
# PS1='\[\e[30;48;5;81;1m\] $(spwd) \[\e[0;38;5;81;48;5;86m\]\[\e[30;1m\] \u \[\e[0;38;5;86;48;5;140m\]\[\e[30;1m\] \$ \[\e[0;38;5;140m\] \[\e[0m\]'
# PS1='\[\e[30;48;5;81;1m\] $(spwd) \[\e[0;38;5;81;48;5;86m\]\[\e[30;1m\] \u \[\e[0;38;5;86;48;5;140m\]\[\e[30;1m\] \$ \[\e[0;38;5;140m\] \[\e[0m\]'
# }}}

# shopt {{{
shopt -s checkwinsize
shopt -s histappend
shopt -s globstar
shopt -s cdspell
shopt -s autocd

set -o vi
set -C
# }}}

if [[ $(tty) = *tty* ]]; then
    echo "${RED}tty${NC} detected, no annoying messages"
    return
fi

~/.local/bin/clear.sh

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

# Emilly M.S.H. ;D

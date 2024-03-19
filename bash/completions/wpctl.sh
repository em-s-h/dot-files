#!/bin/bash

_wpctl_bash_completion() {
    if [[ ${#COMP_WORDS[@]} -le 2 ]]; then
        COMPREPLY=( $(compgen -W "status inspect set-default set-volume set-mute set-profile clear-default" -- "${COMP_WORDS[COMP_CWORD]}") )
    fi
}

complete -F _wpctl_bash_completion wpctl

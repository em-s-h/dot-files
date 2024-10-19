#!/bin/bash

_wpctl_bash_completion() {
    local first_char=$(cut -c -1 <<< "${COMP_WORDS[1]}")

    if [[ $first_char == '-' && ${#COMP_WORDS[@]} -le 2 ]]; then
        COMPREPLY=( $(compgen -W "--help" -- "${COMP_WORDS[COMP_CWORD]}") )

    elif [[ ${#COMP_WORDS[@]} -le 2 ]]; then
        COMPREPLY=( $(compgen -W "status get-volume inspect set-default set-volume set-mute set-profile set-route clear-default settings set-log-level" -- "${COMP_WORDS[COMP_CWORD]}") )
    fi
}

complete -F _wpctl_bash_completion wpctl

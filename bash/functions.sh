up_mirrors () {
    # {{{
    local tmp_file="$(mktemp)" && \
        rate-mirrors --save=$tmp_file --protocol=https --max-jumps=5 arch && \
        sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-back && \
        sudo mv $tmp_file /etc/pacman.d/mirrorlist
}
# }}}

yt-ogg () {
# {{{
    local tmp=/tmp/tmp.wav
    local file_name="${1/\.ogg/}"
    local url="$2"

    yt-dlp -x --audio-format wav --audio-quality 0 -o "$tmp" "$url"
    ffmpeg -i "$tmp" "${file_name}.ogg"
    rm "$tmp"
}
# }}}

mkcd () {
    # {{{
    mkdir "$1" && cd "$1"
}
# }}}

mksh () {
    # {{{
    local arg1="${1//.sh/}.sh"

    touch "$arg1"
    chmod 755 "$arg1"

    echo -e '#!/bin/bash \n' >| "$arg1"
    vim "$arg1"
}
# }}}

filel() {
    # {{{
    file "$@" | sed "s/,/,\n/g"
}
# }}}

# Emilly M.S.H. :D

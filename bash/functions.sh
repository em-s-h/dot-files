# Bash functions

aurinstall() {
# {{{
    read -p "Have you verified the build files? (Y/n) " prompt
    if [[ $prompt != [Yy]* ]]; then
        vi ./PKGBUILD -p
    fi
    makepkg -sirc
}
# }}}

up_mirrors () {
    # {{{
    local tmp_file="$(mktemp)" && \
        rate-mirrors --save=$tmp_file --protocol=https --max-jumps=5 arch && \
        sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-back && \
        sudo mv $tmp_file /etc/pacman.d/mirrorlist
}
# }}}

pacupdate() {
# {{{
    read -p "Do you wish to update the mirrors? (Y/n) " prompt
    if [[ $prompt = [Yy]* ]]; then
        up_mirrors
    fi
    sudo pacman -Syu
}
# }}}

yt-ogg () {
# {{{
    local tmp=/tmp/tmp.wav
    local file_name="${1?Missing file name}"
    local file_name="${file_name//.ogg/}"
    local url="${2?Missing url}"

    yt-dlp -x --audio-format wav --audio-quality 0 -o "$tmp" "$url"
    ffmpeg -i "$tmp" "${file_name}.ogg"
    rm "$tmp"
}
# }}}

yt-ogg-sect () {
# {{{
    local tmp=/tmp/tmp.wav
    local sect="${1?Missing section}"
    local file_name="${2?Missing file name}"
    local url="${3?Missing url}"

    yt-dlp -x --audio-format wav --audio-quality 0 --download-sections "$sect" -o "$tmp" "$url"
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
    /usr/bin/nvim "$arg1"
}
# }}}

filel() {
    # {{{
    file "$@" | sed "s/,/,\n/g"
}
# }}}

# Emilly M.S.H. :D

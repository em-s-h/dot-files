function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd "63b8ff"
    set -l suffix '$'

    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    set -l cwd (set_color $color_cwd)(prompt_pwd -D 3)
    set suffix (set_color "9f79ee") $suffix
    set -l user (set_color "7fffd4") $USER

    echo -n -s $cwd $normal ": " $user $suffix $normal " " 
end

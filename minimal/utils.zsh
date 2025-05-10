# Should be used with $1 as $p10k_applied
function apply_p10k {
    if [[ ! $1 ]] && [[ -f $ZDOTDIR/.p10k.zsh ]]; then
        source $ZDOTDIR/.p10k.zsh
        p10k_applied=true
    fi
}


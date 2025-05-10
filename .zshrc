# For a zsh config without home manager

INSTANT_PROMPT="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r $INSTANT_PROMPT ]]; then
  source $INSTANT_PROMPT
fi

source $ZDOTDIR/minimal/utils.zsh

# Debug start time
alias datenow="date +\"%s,%N\""
# datenow
# echo "START0"

apply_p10k $p10k_applied
# echo $p10k_applied

ln -s $ZDOTDIR/.zshrc ~/.zshrc 2> /dev/null

source $ZDOTDIR/minimal/basic.zsh

# =======================
# == Plugins and theme ==
# =======================

# echo "START antigen"
source $ZDOTDIR/minimal/plugins.zsh
# echo "END antigen"

# datenow

apply_p10k $p10k_applied

source $ZDOTDIR/minimal/completion.zsh

# datenow

eval "$(zoxide init --cmd cd zsh)"

# CUSTOM ALIASES

# clear

source $ZDOTDIR/minimal/aliases.zsh

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# datenow
# zprof

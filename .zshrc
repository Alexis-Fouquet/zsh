INSTANT_PROMPT="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r $INSTANT_PROMPT ]]; then
  source $INSTANT_PROMPT
fi

# Debug start time
alias datenow="date +\"%s,%N\""
datenow
# echo "START0"

p10k_applied=false
if [[ -f $ZDOTDIR/.p10k.zsh ]]; then
    time source $ZDOTDIR/.p10k.zsh
    p10k_applied=true
fi

ln -s $ZDOTDIR/.zshrc ~/.zshrc 2> /dev/null

# =================
# == Basic setup ==
# ================

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export ZSH="$ZDOTDIR/ohmyzsh"
export PATH=$PATH:"/var/lib/flatpak/exports/bin"
# export PATH=$PATH:$ZDOTDIR:$ZSH

unsetopt beep
setopt autocd
# Vim better than emacs
bindkey -v

# =======================
# == Plugins and theme ==
# =======================

# echo "START antidote"
# datenow

source $ZDOTDIR/.antidote/antidote.zsh
antidote load

zstyle ':omz:update' mode reminder
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# echo "END antidote"
# datenow

if [[ ! $p10k_applied ]] && [[ -f $ZDOTDIR/.p10k.zsh ]]; then
    source $ZDOTDIR/.p10k.zsh
    p10k_applied=true
fi

# Push the directory on the stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Show the list of completions and allow to choose in the list
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# datenow
# echo "Compinit"

autoload -Uz compinit
compinit

# datenow

eval "$(zoxide init --cmd cd zsh)"

# CUSTOM ALIASES

# clear

alias ls="eza --icons=auto"
alias vim="nvim"

git config --global alias.adog "log --all --decorate --oneline --graph"
alias gdog='git adog'

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

datenow
# zprof

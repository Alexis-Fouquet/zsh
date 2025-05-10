
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


INSTANT_PROMPT="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r $INSTANT_PROMPT ]]; then
  source $INSTANT_PROMPT
fi

p10k_applied=false
if [[ -f $ZDOTDIR/.p10k.zsh ]]; then
    source $ZDOTDIR/.p10k.zsh
    p10k_applied=true
fi

echo "START"
ln -s $ZDOTDIR/.zshrc ~/.zshrc

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

source $ZDOTDIR/antigen.zsh

antigen use oh-my-zsh

zstyle ':omz:update' mode reminder
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

antigen bundle git
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use

antigen bundle pip

# p10k
antigen theme romkatv/powerlevel10k

echo "apply"

antigen apply

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

autoload -Uz compinit
compinit

eval "$(zoxide init --cmd cd zsh)"

# CUSTOM ALIASES

# clear

echo "END"

alias ls="eza --icons=auto"
alias vim="nvim"

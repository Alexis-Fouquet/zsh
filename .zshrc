echo "START"

# =================
# == Basic setup ==
# ================

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export ZSH="$ZDOTDIR/ohmyzsh"

unsetopt beep
setopt autocd
# Vim better than emacs
bindkey -v

# Push the directory on the stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Show the list of completions and allow to choose in the list
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# =======================
# == Plugins and theme ==
# =======================

source $ZDOTDIR/antigen.zsh

antigen reset
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

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

antigen apply

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit
compinit

eval "$(zoxide init --cmd cd zsh)"

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# CUSTOM ALIASES
alias ls="eza --icons=auto"

# clear

echo "END"


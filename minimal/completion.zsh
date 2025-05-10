
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


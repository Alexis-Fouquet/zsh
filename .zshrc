if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$ZDOTDIR/ohmyzsh"
source ~/.config/zsh/antigen.zsh

antigen reset
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use

antigen theme romkatv/powerlevel10k

antigen apply
echo "Antigen"

unsetopt beep
eval "$(zoxide init zsh)"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
bindkey -e

zstyle :compinstall filename '~/.config/zsh/.zshrc'

_comp_options+=(globdots)

setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

prompt_setup() {
    # RESULT EXPECTED : -> user: path>
    PROMPT=$'%F{yellow}->%f %F{green}%n%f: %F{blue}%~%f%B>%b'
}

# prompt_setup

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit
compinit

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# CUSTOM ALIASES
# alias ls="eza --icons=always"
alias cd="z"

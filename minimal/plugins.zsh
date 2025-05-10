source $ZDOTDIR/antigen.zsh

antigen theme romkatv/powerlevel10k

antigen use oh-my-zsh

zstyle ':omz:update' mode reminder
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

antigen bundle git
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use

antigen apply

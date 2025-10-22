PROMPT='> '

# export ZSH="$HOME/.oh-my-zsh"
#
# ZSH_THEME=""
#
# source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias AstroNvim="NVIM_APPNAME=AstroNvim nvim"
alias LazyVim="NVIM_APPNAME=LazyVim nvim"
alias NvChad="NVIM_APPNAME=NvChad nvim"

if [ -z "$TMUX" ]; then
  tmux attach || tmux new -s main
fi

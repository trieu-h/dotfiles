export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/haitrieu/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Press ctrl-z to make vim foreground
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias nv="nvim"
alias lz="lazygit"
alias ls="ls -a"
alias g="git"
alias nv="~/Applications/nvim.appimage"
alias tm="tmux"

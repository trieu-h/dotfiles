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

# For when I use external keyboard
toggle-keyboard() {
  local device='AT Translated Set 2 keyboard'
  local enabled=$(xinput list-props $device | grep 'Device Enabled' | grep -o '[01]$')
  if [[ $enabled -eq 1 ]]
  then
    xinput disable $device
    echo "Laptop keyboard disabled"
  else
    xinput enable $device
    echo "Laptop keyboard enabled"
  fi
}

# Swap ctrl and caps lock
setxkbmap -layout us -option ctrl:swapcaps

# Set repeated key rate
xset r rate 220 40

alias nv="nvim"
alias lz="lazygit"
alias ls="ls -a"
alias g="git"
alias nv="~/Applications/nvim.appimage"
alias dot="~/.config"
alias project="~/Project/Personal"
alias tm="tmux"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export DOOM=$HOME/.emacs.d/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH:$GOBIN:$DOOM

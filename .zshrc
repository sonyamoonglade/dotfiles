export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/opt/homebrew/bin
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/bin
ZSH_THEME="robbyrussell"
plugins=(git)


source $ZSH/oh-my-zsh.sh

# Personal...
alias python="python3"
alias v="nvim"
alias e="nvim ."
alias gs="git status"
alias gp="git push"
alias dvm='colima start --arch x86_64 --disk 60 --cpu 2'
alias dvm-stop='colima stop'
alias m="make"

export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
export GOPROXY=https://proxy.golang.org

#go
export GOROOT=/usr/local/go
export GOBIN=~/.go-installs/bin

export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT
export PATH=$PATH:$GOBIN
export PATH=$PATH:/home/$USER/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:~/.o3-cli/bin

alias ozon="source ~/.o3.env.sh"

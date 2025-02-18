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
alias gt="go test -count=1 -v -run"
gtc ()
{
   go test -coverprofile cover.out ./... -run "$1" && \ 
      go tool cover -html cover.out && \
      rm cover.out
}
alias gs="git status"
alias gp="git push"
alias gl="git log"
alias gd="git diff"
alias dvm='colima start --vm-type=vz \
   --vz-rosetta \
   --arch x86_64 \
   --disk 60 \
   --cpu 8 \
   --memory 4'
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
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

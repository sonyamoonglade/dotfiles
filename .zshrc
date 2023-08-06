export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Personal...
alias godev="cd ~/development/golang"
alias dev="cd ~/development"
alias python="python3"
alias v="nvim"

#node
export NVM_DIR="$HOME/.nvm"
export NODE_BIN=$NVM_DIR/versions/node/v20.5.0/bin/
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#go
export GOROOT=/usr/local/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT

#python
export PATH=$PATH:/usr/bin/python3


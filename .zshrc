export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"



ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Personal...
alias godev="cd ~/development/golang"
alias webdev="cd ~/development/web"
alias dev="cd ~/development"
alias python="python3"
alias v="nvim"

# Required for my system
PRIMARY_NAMESERVER="8.8.8.8"
alias ns="sudo tee /etc/resolv.conf <<< 'nameserver $PRIMARY_NAMESERVER'"

#node
export PATH=$PATH:/usr/local/lib/nodejs/node-16.17.1/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#go
export GOROOT=/usr/local/go
export GOBIN=/usr/local/go/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT

#python
export PATH=$PATH:/usr/bin/python3

#rust
export PATH=$PATH:/usr/local/rust

# git (self upgrade version)
export PATH="/usr/local/git/bin:${PATH}"

#packer
export PATH="${HOME}/.packer/latest:${PATH}"

# nodebrew
export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# rbenv
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
  eval "$(rbenv init -)"
fi

# pyenv
if [ -d ${HOME}/.pyenv  ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# plenv
if [ -d ${HOME}/.plenv  ] ; then
  export PATH=${HOME}/.plenv/bin/:${HOME}/.plenv/shims:${PATH}
  eval "$(plenv init -)"
fi

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

alias vim=/usr/local/Cellar/vim/7.4.430_1/bin/vim
alias ip=~/.pyenv/shims/ipython
export PGDATA=/usr/local/var/postgres

# docker
eval "$(docker-machine env default)"

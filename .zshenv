setopt no_global_rcs
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN || -z "${TMPDIR}" ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# rbenv
eval "$(rbenv init -)"

# pyenv
if [ -d ${HOME}/.pyenv  ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# golang
if [ -d /usr/local/opt/go/libexec ] ; then
  export GOROOT=/usr/local/opt/go/libexec
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH

source ~/.aliases
export EDITOR=/usr/local/bin/vim

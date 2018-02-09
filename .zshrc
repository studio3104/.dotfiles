# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LESS='-iMR'

function cd {
    builtin cd "$@"
    if [ -f "Pipfile" ] ; then
        pipenv shell
    fi
}

# cdr
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

# setting for peco
for f (~/.dotfiles/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history
bindkey '^f' peco-cdr
bindkey '^]' peco-ghq-list-cd
bindkey '^t' peco-tree-vim
bindkey '^g' peco-tree-cd

bindkey '^q' peco-jira-co
bindkey '^n' peco-gh-new
bindkey '^w' peco-jira-browser

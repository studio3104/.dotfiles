# Theme
set fish_theme agnoster
set -g theme_color_scheme dracula

# Peco functions
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

# Language runtimes
set PATH $HOME/.pyenv/shims $PATH
eval (pyenv init - | source)
set PATH $HOME/.nodenv/shims $PATH
eval (nodenv init - | source)
set PATH $HOME/.rbenv/shims $PATH
eval (rbenv init - | source)

# AWS CLI completion
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Activate pipenv shell
set pipenv_fish_fancy yes

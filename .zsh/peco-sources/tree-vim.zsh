function peco-tree-vim(){
  local selected_file=$(tree -a -i -f | egrep -v '\d+directories,\d+files' | peco)
  if [ -f ${selected_file} ]; then
      BUFFER="vim ${selected_file}"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-tree-vim

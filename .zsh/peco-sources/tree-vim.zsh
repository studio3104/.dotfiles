function peco-tree-vim(){
  local selected_file=$(tree -a -i -f --noreport | peco --query "$LBUFFER")
  if [ -f ${selected_file} ]; then
      BUFFER="vim ${selected_file}"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-tree-vim

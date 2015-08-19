function peco-tree-cd(){
  local selected_dir=$(tree -d -a -i -f --noreport | peco --query "$LBUFFER")
  if [ -n "${selected_dir}" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-tree-cd

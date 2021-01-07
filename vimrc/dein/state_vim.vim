if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/satsuz/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim82,/usr/local/share/vim/vimfiles/after,/Users/satsuz/.vim/after,/Users/satsuz/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/satsuz/.vimrc', '/Users/satsuz/.vim/rc/dein.toml', '/Users/satsuz/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/satsuz/.vim/dein'
let g:dein#_runtime_path = '/Users/satsuz/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/satsuz/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/satsuz/.vim,/usr/local/share/vim/vimfiles,/Users/satsuz/.vim/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vim82,/Users/satsuz/.vim/dein/.cache/.vimrc/.dein/after,/usr/local/share/vim/vimfiles/after,/Users/satsuz/.vim/after,/Users/satsuz/.vim/dein/repos/github.com/Shougo/dein.vim'
filetype off
  set laststatus=2
  set noshowmode
  let g:lightline = {'colorscheme': 'wombat',}
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
  let g:asyncomplete_remove_duplicates = 1
  let g:asyncomplete_auto_popup = 0
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  let g:ale_python_mypy_options = '--follow-imports=skip --disallow-untyped-defs --disallow-untyped-calls'
  let g:ale_sign_column_always = 1
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:lightline = {'active': {  'left': [    ['mode', 'paste'],    ['readonly', 'filename', 'modified', 'ale'],  ]},'component_function': {  'ale': 'ALEGetStatusLine'}}

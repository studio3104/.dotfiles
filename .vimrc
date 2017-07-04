autocmd BufNewFile *.pl 0r ${HOME}/.dotfiles/vimrc/.pl
autocmd BufNewFile *.sh 0r ${HOME}/.dotfiles/vimrc/.sh
autocmd BufNewFile *.rb 0r ${HOME}/.dotfiles/vimrc/.rb
autocmd BufNewFile *.go 0r ${HOME}/.dotfiles/vimrc/.go
autocmd BufNewFile *.py 0r ${HOME}/.dotfiles/vimrc/.py
map <F4>  :w !perl<CR>
map <F5>  :w !go run %<CR>
map <F6>  :w !ruby<CR>
map <F7>  :w !python<CR>

" Delete に Backspace の仕事させる
map  
map!  
set backspace=indent,eol,start

" shebang付きのファイルに自動的に実行権限を付与する
autocmd BufWritePost * :call AddExecmod()
function AddExecmod()
  let line = getline(1)
  if strpart(line, 0, 2) == "#!"
    call system("chmod +x ". expand("%"))
  endif
endfunction

" 行折り返さない
set nowrap

" BEEP音を切る
set visualbell

" シンタックスハイライトを有効にする
syntax on

" TAB幅をスペース二つ分にする
set tabstop=2

" タブ文字を\tじゃなくスペースにする
set expandtab

" 自動インデントとインデント時の幅
set cindent
set shiftwidth=2
autocmd! FileType perl setlocal shiftwidth=4

" 行番号を表示する
set nu

" ウィンドウタイトルを編集中のファイル名にする
set title

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" 小文字の検索で大文字も見つかるようにする
set ignorecase

" 検索文字を打ち込むと即検索する
set incsearch

" 検索結果をハイライトする
set hlsearch

" 見えない文字を可視化
set list

" Whitespaces
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" BEGIN dein
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" END dein

filetype plugin indent on
syntax enable

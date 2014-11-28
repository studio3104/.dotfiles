autocmd BufNewFile *.pl 0r ${HOME}/.dotfiles/vimrc/.pl
autocmd BufNewFile *.sh 0r ${HOME}/.dotfiles/vimrc/.sh
autocmd BufNewFile *.rb 0r ${HOME}/.dotfiles/vimrc/.rb
autocmd BufNewFile *.go 0r ${HOME}/.dotfiles/vimrc/.go
map <F4>  :w !perl<CR>
map <F5>  :w !go run %<CR>
map <F6>  :w !ruby<CR>
map <F7>  :w !rspec %<CR>

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

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" Add or remove your Bundles here:
NeoBundle 'Shougo/neocomplete'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'

" neosnippet settings
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" END neosnippet settins

" Required:
call neobundle#end()

" development------------------------------
" Ruby
NeoBundle 'alpaca-tc/vim-endwise.git'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ngmy/vim-rubocop'

" coffee-script
NeoBundle 'kchmck/vim-coffee-script'

" markdown
NeoBundle 'plasticboy/vim-markdown'

" Go
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
NeoBundle 'vim-jp/vim-go-extra'

" syntastic------------------------------------
NeoBundle 'scrooloose/syntastic'
" Perl
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
" END syntastic--------------------------------

NeoBundle 'cespare/vim-toml'
NeoBundle 'AndrewRadev/switch.vim'
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif
" END development--------------------------

NeoBundleCheck
"End NeoBundle Scripts-------------------------

filetype plugin indent on

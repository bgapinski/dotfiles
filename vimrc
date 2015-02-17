set nocompatible
filetype off


" Vundle requirements
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" All the plugins
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/vimproc.vim' "ghc-mod dependency
Plugin 'Shougo/vimshell.vim'

" Other plugins
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
"Plugin 'zhaocai/GoldenView.Vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'bkad/CamelCaseMotion'

Plugin 'moll/vim-bbye'
Plugin 'majutsushi/tagbar'
Plugin 'jpalardy/vim-slime'

" Language plugins
"Plugin 'raichoo/haskell-vim'
Plugin 'bgapinski/vim2hs' "Personal fork
" Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'idris-hackers/idris-vim'

" Theme
Plugin 'w0ng/vim-hybrid'

call vundle#end()
filetype plugin indent on

" Basic settings
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set backspace=indent,eol,start
set number
set relativenumber
set ruler
set scrolloff=5
set showmode
set showcmd
set ttyfast

set autoread
set encoding=utf-8
set ffs=unix

set laststatus=2

set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.hi,*.aux,*.pyc,*.class

set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set cmdheight=1

syntax enable
filetype plugin on

set shortmess=atI

set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hidden

set noerrorbells
set vb t_vb=

set clipboard=unnamedplus

set updatecount=0
set lbr
set tw=500
set wrap

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos
cmap w!! %!sudo tee > /dev/null %

set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"
let $PATH = $PATH . ':' . expand("~/.vimscripts")

set mouse=a

" Key rebindings
let mapleader = "\<Space>"
set tm=2000

vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>d "+d
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p

nnoremap <Leader>bd :Bd<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
map <leader>tg :!codex update<CR>:call system("git hscope")<CR><CR>:call LoadHscope()<CR>
nnoremap <Leader>u :GundoToggle<CR>

noremap <Leader>b<space> :CtrlPBuffer<CR>

nnoremap <Leader>ma :set mouse=a<CR>
nnoremap <Leader>mo :set mouse=<CR>

nnoremap ; :
nnoremap j gj
nnoremap k gk

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Ex mode is never used
map Q gq

map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

nmap <Leader>nh :let @/=''<CR>

" Terminal color
if &term =~ '256color'
  set t_ut=
endif

set t_Co=256
set background=dark
colorscheme hybrid
hi Normal ctermbg = none

hi! link SignColumn LineNr
hi! link SyntasticErrorSign ErrorMsg
hi! link SyntasticWarningSign WarningMsg

hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

" Various plugin initialization
" let g:neocomplete#enable_at_startup = 1
let g:neocomplcache#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_map = '<Leader>e'
let g:haskell_conceal = 0
let g:necoghc_enable_detailed_browse = 1

augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>
augroup haskell
  autocmd!
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>:SyntasticReset<cr>
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

set csprg=~/.vimscripts/hscope
set csto=1
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()

set completeopt+=longest

" Haskell stuff
" Type of expression under cursor
" nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
" nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
" nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>
" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

let g:hoogle_search_databases = "/home/brian/hoogle"
" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>


function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

:let &makeprg='hdevtools check %'
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

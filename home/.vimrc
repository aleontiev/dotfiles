"
" Go vim packages
"
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

"
" Vundle packages
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins configured here need to be added
" to dotfiles/.gitmodules if managed with 
" homesick
Plugin 'gmarik/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

"
" Settings
"

" Theme

syntax enable
set background=dark
colorscheme molokai

" Indentation

set noeol " no EOL at EOF
set smartindent
set smarttab
set expandtab
set autoread

set lbr
set tw=500

set tabstop=2
set shiftwidth=2
set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Hotkeys

let mapleader = ","
let g:mapleader = ","
" write
nmap <leader>w :w!<cr>
" write and exit
nmap <leader>wq :wq!<cr>
" format
nmap <leader>f :Autoformat<cr>
" force exit
nmap <leader>q :q!<cr>
" git status
nmap <leader>gs :Gstatus<cr>
" git diff
nmap <leader>gd :Gdiff<cr>

" Display

set ruler
set number

" Search

set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case when lowercase

syntax on

" Language

" python 
let g:formatprg_python = 'autopep8'
let g:formatprg_args_expr_python = '"- --max-line-length 90 --indent-size ".&shiftwidth'
let python_highlight_all=1

" go 
let g:formatprg_go = 'gofmt'
let g:formatprg_args_go = ''

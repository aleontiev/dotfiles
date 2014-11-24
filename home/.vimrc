" go settings
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme molokai
highlight Comment cterm=bold

" indenting

set autoread
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>f :Autoformat<cr>
nmap <leader>q :q!<cr>
nmap <leader>, :nohl<cr>

" Fast saving
set noeol
set smartindent
set smarttab

set number
set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case when lowercase

set expandtab
set smarttab

set lbr
set tw=500

set tabstop=2
set shiftwidth=2
set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" show line numbers
set ruler

" python settings
let g:formatprg_python = 'autopep8'
let g:formatprg_args_expr_python = '"- --max-line-length 90 --indent-size ".&shiftwidth'
let python_highlight_all=1

let g:formatprg_go = 'gofmt'
let g:formatprg_args_go = ''

syntax on

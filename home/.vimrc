"
" Go vim packages
"
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent on

"
" Vundle packages
"

set nocompatible
" filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins configured here need to be added
" to dotfiles/.gitmodules if managed with 
" homesick 

Plugin 'gmarik/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

call vundle#end()
"filetype plugin indent on

"
" Settings
"

" Theme

syntax enable
set background=dark
colorscheme molokai

" Indentation

set backspace=2
set noeol " no EOL at EOF
set autoindent
set smartindent
set smarttab
set expandtab
set autoread

set lbr
set tw=500

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set wrap "Wrap lines

set splitbelow
set splitright

" Remap movement to JKLI
" and h/H -> insert
nmap j <left>
nmap k <down>
nmap l <right>
nmap i <up>
vmap j <left>
vmap k <down>
vmap l <right>
vmap i <up>
nnoremap H I
nnoremap h i

" Hotkeys

let mapleader = ";"
let g:mapleader = ";"
" write
nmap <leader>w :w<cr>
" write and exit
nmap <leader>wq :wq!<cr>
" edit
nmap <leader>e :e 
nmap <leader>. :e .<cr>
" format
nmap <leader>f :Autoformat<cr>
" split/switch 
nmap <leader>v :vsp .<cr>
nmap <leader>s :sp .<cr>
nmap <leader>r <C-w>R
nmap <leader>j <C-w><C-h>
nmap <leader>k <C-w><C-j>
nmap <leader>i <C-w><C-k>
nmap <leader>l <C-w><C-l>
" force quit
nmap <leader>q :q!<cr>
" git 
nmap <leader>gs :Gstatus<cr>
nmap <leader>gd :Gdiff<cr>
" switch between buffers
nmap <leader>n :next<cr>
nmap <leader>p :prev<cr>

" Display

set ruler
set number

" Paste 
set viminfo-=<50,s10 

" Search

set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case when lowercase

syntax on

" Language

" python 
let g:formatprg_python = 'autopep8'
let g:formatprg_args_python = '- --max-line-length 90 --indent-size 2'
let python_highlight_all=1

" go 
let g:formatprg_go = 'gofmt'
let g:formatprg_args_go = ''


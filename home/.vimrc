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
" filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" plugins configured here need to be added
" to dotfiles/.gitmodules if managed with 
" homesick 
"
" Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'nvie/vim-flake8'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

"
" Settings
"

let g:airline#extensions#ale#enabled = 1

" Theme

set background=dark
colorscheme molokai

" Indentation

set clipboard=unnamed
set backspace=2
set noeol " no EOL at EOF
set autoindent
set smartindent
set smarttab
set expandtab
set autoread

set lbr

set tabstop=4
set softtabstop=4
set shiftwidth=4
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

augroup netrw_dvorak_fix
    autocmd!
    autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
augroup END
function! Fix_netrw_maps_for_dvorak()
    noremap <buffer> j <left>
    noremap <buffer> k <down>
    noremap <buffer> i <up>
    noremap <buffer> l <right>
endfunction

nnoremap H I
nnoremap h i

" Hotkeys

let mapleader = ";"
let g:mapleader = ";"

nmap <leader>en :ALENext<cr>
nmap <leader>ep :ALEPrevious<cr>
" write
nmap <leader>w :w<cr>
" write and exit
" edit
nmap <leader>o :e .<cr> 
nmap <leader>O :e<cr>
" split/switch 
nmap <leader>\ :vsp .<cr>
nmap <leader>- :sp .<cr>
nmap <leader>% <C-w>R
nmap <leader>j <C-w><C-h>
nmap <leader>k <C-w><C-j>
nmap <leader>i <C-w><C-k>
nmap <leader>l <C-w><C-l>
" force quit
nmap <leader>q :q!<cr>
" switch between buffers
nmap <leader>n :next<cr>
nmap <leader>p :prev<cr>
nmap <leader>d :call NERDTreeToggleInCurDir()<cr>
nmap <leader>D :NERDTreeFind<cr>
nmap <leader>T :tabe<cr>
nmap <leader>. :tabn<cr>
nmap <leader>, :tabp<cr>

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
let python_highlight_all=1

" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_loc = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0


" format
nmap <leader>f :Autoformat<cr>
nmap <leader>c :call SyntasticCheck()<cr>

" swap files
set directory=~/.vim/_tmp/
set backupdir=~/.vim/_backup/

set laststatus=2


function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

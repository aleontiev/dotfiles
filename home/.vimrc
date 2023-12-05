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
Plugin 'gmarik/Vundle.vim'
Plugin 'HerringtonDarkholme/yats'
" Plugin 'Chiel92/vim-autoformat'
" Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
" Plugin 'nvie/vim-flake8'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'posva/vim-vue'
Plugin 'neoclide/coc.nvim'


call vundle#end()
filetype plugin indent on  " required

"
" Settings
"
"aug python
"  au!
"  au BufWrite *.py call CocAction('format')
"aug END

" coc

set updatetime=200
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

let g:airline#extensions#hunks#enabled = 0
let g:vue_disable_pre_processors=1
let g:airline_powerline_fonts = 1

" Theme

set background=dark
colorscheme molokai

" Indentation

set clipboard=exclude:.*
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

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f :call CocActionAsync('format')<cr>
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
nmap <leader>wq :wq!<cr>
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

" Language

" python 
let python_highlight_all=1


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

syntax on


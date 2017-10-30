set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'suan/vim-instant-markdown'
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }
let g:airline#extensions#tabline#enabled = 1


""" BASIC
set nu
set cursorline
set ruler
set autoindent
set laststatus=2
set pastetoggle=<F2>
"set relativenumber

""" SYNTAX
syntax on
filetype plugin indent on
filetype plugin on

""" REMAPS
"inoremap { {}<ESC>i<kENTER><kENTER><ESC>ki<TAB>
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;m <p align=center></p><Space><++><Esc>FpT<hi

map <C-J> :bprev!<CR>
map <C-K> :bnext!<CR>

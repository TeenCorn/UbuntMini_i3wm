set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set encoding=utf-8
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

""" BASIC 
set nu
set cursorline
set ruler
set autoindent
set laststatus=2

""" SYNTAX
syntax on
filetype plugin indent on

""" REMAPS
"inoremap { {}<ESC>i<kENTER><kENTER><ESC>ki<TAB>

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
Plugin 'skielbasa/vim-material-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
set encoding=utf-8

" Vim-airline Stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
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
set hlsearch
set ignorecase
"set relativenumber

" Color Scheme options
" set background=dark
colorscheme material-monokai
let g:materialmonokai_italic=1

" Global <leader> remap to space
" Useful <leader> remaps
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
nnoremap <leader>ss :so %<CR>
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>d :tabn<CR>
nnoremap <leader>a :tabp<CR>
nnoremap <leader>t :tabe<Space>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>h :noh<CR>

" Ranger.vim Settings
let g:NERDTreeHijackNetrw = 0
let g:ranger_map_keys = 0
nnoremap <leader>f :Ranger<CR>
map <leader>vf :vsp \| Ranger<CR>
map <leader>sf :sp \| Ranger<CR>

" YCM options
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap ,g :YcmCompleter GoTo \| vsplit<CR>

" Ultisnips Mapping
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Play nicely please, YCM and Ultisnips
let g:SuperTabDefaultCompletionType = '<C-y>'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

""" SYNTAX
syntax on
filetype plugin indent on
filetype plugin on

""" REMAPS
"inoremap { {}<ESC>i<kENTER><kENTER><ESC>ki<TAB>

map <C-n> :NERDTreeToggle<CR>
" Window Movement
noremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
noremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
" Window Creation
" map <leader><leader>v :vsp
" map <leader><leader>s :sp

" Move to vimrc anywhere
map cfg :vsp ~/.vimrc<CR>

" Commands to be called when you enter vim

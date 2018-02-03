"Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skielbasa/vim-material-monokai'
Plug 'ryanoasis/vim-devicons'
Plug 'Heorhiy/VisualStudioDark.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

""" Mundane
set background=dark
set termguicolors
set encoding=utf-8

""" Theme
colorscheme VisualStudioDark
let g:materialmonokai_suble_spell=1
let g:airline_theme = 'angr'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""" Basic airline stuff

""" BASIC
set nu
set rnu
set incsearch
set cursorline
set ruler
set autoindent
set laststatus=2
set pastetoggle=<F2>
set hlsearch
set ignorecase
set smartcase
set relativenumber
let g:deoplete#enable_at_startup = 1

" Global <leader> remap to space
" Useful <leader> remaps
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
nnoremap <leader>ss :so %<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>d :tabn<CR>
nnoremap <leader>a :tabp<CR>
nnoremap <leader>t :tabe<Space>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>h :noh<CR>
map <C-n> :NERDTreeToggle<CR>

" Window Movement
noremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
noremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Move to nvim conf
map cfg :vsp ~/.config/nvim/init.vim<CR>

" Converts the current .md file to pdf using pandoc and opens Mupdf with the
" newly created pdf
nnoremap <F5> :! ~/scripts/./vimpdf.sh %<CR>

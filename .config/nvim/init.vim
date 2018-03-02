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
Plug 'liuchengxu/space-vim-dark'
Plug 'challenger-deep-theme/vim'
Plug 'Valloric/YouCompleteMe'
" Initialize plugin system
call plug#end()

""" Mundane
set background=dark
set termguicolors
set encoding=utf-8

""" Theme
colorscheme material-monokai
let g:materialmonokai_suble_spell=1
let g:airline_theme = 'deus'
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
set tabstop=4
set shiftwidth=4

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

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Play nicely please, YCM and Ultisnips
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '•'
let g:ycm_warning_symbol = '•'

" Move to nvim conf
map cfg :vsp ~/.config/nvim/init.vim<CR>

" Different \"runs\" for different filetypes
autocmd Filetype markdown nnoremap <F5> :! ~/scripts/./vimpdf.sh %<CR>
autocmd Filetype html nnoremap <F5> :! ~/scripts/./mview.sh %<CR>

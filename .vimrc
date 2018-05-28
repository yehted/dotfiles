" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/simpylfold'

" Initialize plugin system
call plug#end()

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Folding
set foldmethod=indent
set foldcolumn=4

" Turn on line numbers
set number
set relativenumber

" Turn on mouse
set mouse=a

" Appearance
set t_Co=256
syntax enable
set background=dark
colorscheme sourcerer

" Spaces and tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set fileformat=unix
set backspace=indent,eol,start
set list
set listchars=tab:>.
set autoindent
filetype indent on

" UI config
set cursorline
set colorcolumn=80
set ruler

" Searching
set incsearch
set hlsearch

" Key remaps
nmap Y y$
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Strip trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e

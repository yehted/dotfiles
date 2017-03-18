if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

" Vundle required configuration
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'elzr/vim-json'
Plugin 'henrik/vim-indexed-search'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My configuration
" ------------------------------------------------------
" Start NERDTree
autocmd vimenter * NERDTree
autocmd BufWritePre * :%s/\s\+$//e
let NERDTreeIgnore = ['\.pyc$']

" vim airline
set laststatus=2
let g:airline_theme='molokai'

" set term=xterm-256color
" Don't fold things on open
set foldlevel=99

" Turn on line numbers
set number

" Turn on mouse
set mouse=a

" Syntax highlighting
syntax enable
" let python_highlight_all = 1

" Color scheme
set t_Co=256
" let g:solarized_termcolors=256
" colorscheme Tomorrow-Night-Eighties
" set background=dark
colorscheme molokai
let g:molokai_original=1
" let g:rehash256 = 1

" Spaces and tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set shiftround
set fileformat=unix
set backspace=indent,eol,start
set list
set listchars=tab:>.

" UI config
set cursorline
set colorcolumn=80
set ruler

" Searching
set incsearch
set hlsearch

" Key remaps
nmap Y y$
nmap <silent> <C-n> :NERDTreeToggle<CR>

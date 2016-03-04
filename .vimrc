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
Plugin 'ctrlpvim/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My configuration
" ------------------------------------------------------
" Start NERDTree
autocmd vimenter * NERDTree
autocmd BufWritePre * :%s/\s\+$//e

" Don't fold things on open
set foldlevel=99

" Turn on line numbers
set number

" Turn on mouse
set mouse=a

" Color scheme
" set t_Co=256
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" let g:molokai_original=1
" let g:rehash256 = 1

" Syntax highlighting
syntax enable

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

" UI config
set cursorline
set colorcolumn=80

" Searching
set incsearch
set hlsearch


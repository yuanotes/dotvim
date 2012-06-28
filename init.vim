set nocompatible    " not compatible with vi
set guioptions=0    " no gui
let mapleader = "," " map leader
set modeline        " modelien mode
set modelines=5     " detect modelines in 5 lines at head and tail 
set autochdir       " change work directory automatically
set clipboard+=unnamed " set clipboard
set ignorecase
set hlsearch
set incsearch
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set showcmd
set autoread        " auto reload buffer if the file is changed outside Vim
set shell=/bin/bash   " system() may be failed in fishfish
set laststatus=2    " show statusline if one window


" line number tricks
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FocusLost *   :set number              " only for GUI
autocmd FocusGained * :set relativenumber      " only for GUI

syntax on
filetype plugin indent on

" Color scheme
colorscheme evening

" go to last edit position when opening a file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" vam settings
source ~/.vim/vam.vim

" other settings
source ~/.vim/neocomplcache.vim
source ~/.vim/keys.vim
source ~/.vim/vam.vim

" powerline settings
" Make sure you have patched font:
" https://github.com/Lokaltog/vim-powerline/
let g:Powerline_symbols = 'fancy'


if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif

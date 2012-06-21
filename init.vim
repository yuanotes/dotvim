set nocompatible    " not compatible with vi
set guioptions=0    " no gui
set number          " linenumber
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
set shell=/bin/bash   " system() may be failed in fishfish

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

if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif

let s:body=system('uname -a 2>&1')

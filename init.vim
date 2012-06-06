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

source ~/.vim/vam.vim   "vim-addon-manager and extensions

" colorscheme
syntax enable
if has('gui_running') || $TERM=='xterm-256color'
    colorscheme zenburn
else
    colorscheme evening
endif

" go to last edit position when opening a file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" other settings
source ~/.vim/python.vim
source ~/.vim/neocomplcache.vim
source ~/.vim/keys.vim


if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif

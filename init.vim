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
set cursorline      " cursorline
set hidden          " dont't save buffer when changing 


" line number tricks
set relativenumber

syntax on
filetype plugin indent on

" Color scheme
colorscheme evening

" go to last edit position when opening a file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Get vim path
let $MYVIMPATH=expand("<sfile>:p:h")

" vam settings
source $MYVIMPATH/vam.vim

" other settings
source $MYVIMPATH/neocomplcache.vim
source $MYVIMPATH/keys.vim
source $MYVIMPATH/vam.vim

" Zenburn settings
let g:zenburn_force_dark_Background = 1


" powerline settings
" Make sure you have patched font:
" https://github.com/Lokaltog/vim-powerline/
" powerline path
set rtp+=$MYVIMPATH/vim-addons/powerline/powerline/bindings/vim/
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

if filereadable(expand("$MYVIMPATH/custom.vim"))
    source $MYVIMPATH/custom.vim
endif

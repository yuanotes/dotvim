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

" Zenburn settings
let g:zenburn_force_dark_Background = 1
if has('gui_running') || $TERM=='xterm-256color'
     colorscheme zenburn
endif

" Set yankring history directory.
let g:yankring_history_dir=expand('<sfile>:p:h')

" Ignored while searching by Command-T
set wildignore+=*.pyc,.git

" tagbar ctags path
"let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" GUI font
"set guifont=Monaco:h14 "Mac
"set guifont=DejaVu\ Sans\ Mono\ 14 "Linux

" Syntastic settings
let g:syntastic_javascript_jslint_conf="--browser --regexp --es5 --nomen --evil --eqeq --plusplus --continue --forin --bitwise --predef define  --predef require"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'



" JS beautify
let g:jsbeautify = {"jslint_happy":"true"}
" Addons list
let s:base_list = ['The_NERD_tree', 'fugitive', 'Command-T', 'quickrun%3146', 'YankRing', 'sudo', 'Tagbar', 'The_NERD_Commenter', 'FuzzyFinder', 'neocomplcache', 'vimproc', 'Syntastic']
let s:python_list = ['jedi-vim']
let s:go_list = ['github:uggedal/go-vim']
let s:web_list = ['ZenCoding', 'vim-less', 'vim-jsbeautify']
let s:addon_list = s:base_list + s:python_list


if filereadable(expand("$MYVIMPATH/custom.vim"))
    source $MYVIMPATH/custom.vim
endif
call vam#ActivateAddons(addons_list)

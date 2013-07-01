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


" Ignored while searching by Command-T
set wildignore+=*.pyc,.git

" GUI font
if system("uname") == "Darwin"
    set guifont=Monaco:h14 "Mac
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
elseif system("uname") == "Linux"
    set guifont=DejaVu\ Sans\ Mono\ 14 "Linux
endif

" Syntastic settings
let g:syntastic_javascript_jslint_conf="--browser --regexp --es5 --nomen --evil --eqeq --plusplus --continue --forin --bitwise --predef define  --predef require"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" JS beautify
let g:jsbeautify = {"jslint_happy":"true"}
" Addons list
let s:addon_list = ['unite', 'Zenburn', 'The_NERD_tree', 'fugitive', 'Command-T', 'quickrun%3146', 'sudo', 'Tagbar', 'The_NERD_Commenter', 'neocomplcache', 'vimproc', 'Syntastic', 'vim-neatstatus']

call vam#ActivateAddons(s:addon_list)
" Lazy loading
let ft_addons = {
    \ 'go': ['github:uggedal/go-vim'],
    \ 'html': ['ZenCoding'],
    \ 'javascript': ['vim-jsbeautify'],
    \ 'python': ['jedi-vim', 'github:hynek/vim-python-pep8-indent'],
    \ 'less': ['vim-less']
    \ }
au FileType * for l in values(filter(copy(ft_addons), string(expand('<amatch>')).' =~ v:key')) | call vam#ActivateAddons(l, {'force_loading_plugins_now':1}) | endfor

" other settings
source $MYVIMPATH/functions.vim
source $MYVIMPATH/neocomplcache.vim
source $MYVIMPATH/keys.vim

" Remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Zenburn settings
let g:zenburn_force_dark_Background = 1
if has('gui_running') || $TERM=='xterm-256color'
     colorscheme zenburn
endif

if filereadable(expand("$MYVIMPATH/custom.vim"))
    source $MYVIMPATH/custom.vim
endif

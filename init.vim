" no gui
set go=0

" line number
set nu

" map leader
let mapleader = ","

" set font
if hostname() == 'AppleDream.local'
    set guifont=Monaco:h13
elseif hostname() == 'dream'
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

" runtimepath
" set rtp+=$HOME/vim/runtime/

" not compatible with vi
set nocompatible

" modelien mode
set modeline
" detect modelines in 5 lines at
" head and tail 
set modelines=5

" change work directory automatically
set autochdir 

" set clipboard
set clipboard+=unnamed

" searching
set ignorecase
set hlsearch
set incsearch

" indent and tab
set autoindent
set tabstop=4		" tab
set shiftwidth=4 	" autoindent tab 
set expandtab		" spaces instead of tab
set sts=4			" splits the window for the selected tag.

" show command
set sc  "showcmd

"autocmd FileType cpp nmap <F5> :w<cr>:exe ":set makeprg=g++\\\ -Wall\\\ -o\\\ ".expand("%:r")."\\\ ".expand("%")<cr>:make<cr><cr>:cw<cr>
"autocmd FileType c nmap <F5> :w<cr>:exe ":set makeprg=gcc\\\ -Wall\\\ -o\\\ ".expand("%:r")."\\\ ".expand("%")<cr>:make<cr><cr>:cw<cr>
"autocmd FileType c,cpp nmap <F8> :exe "!./".expand("%:r")<cr>

"nmap <F6> :cp<cr>
"nmap <F7> :cn<cr>
so ~/.vim/vundle.vim

" vim-colors-solarized
syntax enable
if has('gui_running')
    set background=light 
    colorscheme solarized
else
    "set background=dark
    colorscheme evening
endif

" tagbar settings -----------------------------------------------------------
nnoremap <silent> <F8> :TagbarToggle<CR>
if hostname() == 'AppleDream.local'
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

" Python
source ~/.vim/python.vim

" neocomplcache
source ~/.vim/neocomplcache.vim

autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Keybindings
source ~/.vim/keys.vim

" no gui
set go=0

" line number
set nu

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

" Vundle settings
filetype off
set rtp+=~/.vim/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
" Bundle 'gmarik/vundle'

" Python
Bundle 'klen/python-mode'

"Bundle 'jceb/vim-orgmode'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'vim-scripts/EasyMotion'
"Bundle 'vim-scripts/Engspchk'

" vimproc used by neocomplcache
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar' 

" webapi-vim used by googletasks-vim 
"Bundle 'mattn/webapi-vim'
"Bundle 'mattn/googletasks-vim'

" vim-scripts bundles
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'vimwiki'
Bundle 'taglist.vim'

filetype plugin indent on " required by vundle.

" vim-notes
"let g:notes_directory = '~/Nutstore/Notes'

" vim-colors-solarized
syntax enable
if has('gui_running')
    set background=light 
else
    set background=dark
endif
colorscheme solarized

" vim-virtualenv
"let g:virtualenv_directory = $HOME.'/public_html'
"let $VIRTUAL_ENV=g:virtualenv_directory.'/'.'env'
" let g:virtualenv_auto_activate = 1 " time consuming

" vimwiki settings -----------------------------------------------------------
"let g:vimwiki_list = [{'path':'~/Nutstore/vimwiki/', 'path_html':'~/Nutstore/vimwiki/public_html/'}] 

"remap
" map <Leader>w <Plug>VimwikiIndex
" map <Leader>wt <Plug>VimwikiTabIndex
" map <Leader>i <Plug>VimwikiDiaryIndex
" map <Leader>d <Plug>VimwikiMakeDiaryNote
" map <Leader>dt <Plug>VimwikiTabMakeDiaryNote

" vimwiki settings end -------------------------------------------------------
"
" taglist settings -----------------------------------------------------------
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File=1


" Keybindings
source ~/.vim/keys.vim

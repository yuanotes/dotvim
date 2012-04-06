" Vundle settings
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Python
Bundle 'klen/python-mode'

Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/fcitx.vim'

"Bundle 'jceb/vim-orgmode'
Bundle 'hsitz/VimOrganizer'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'vim-scripts/EasyMotion'
"Bundle 'vim-scripts/Engspchk'
Bundle 'groenewege/vim-less'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar' 
Bundle 'mattn/zencoding-vim'

" vimproc used by neocomplcache
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'

" vim-scripts bundles
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'vimwiki'
"Bundle 'taglist.vim'
Bundle 'YankRing.vim'

filetype plugin indent on " required by vundle.


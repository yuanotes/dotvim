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
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

" line number tricks
set relativenumber

syntax on
filetype plugin indent on

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
if has('gui_macvim')
    set guifont=Menlo\ Regular:h18 "Mac
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
elseif has("gui_gtk")
    set guifont=DejaVu\ Sans\ Mono\ 14 "Linux
endif

" Syntastic settings
let g:syntastic_javascript_jslint_conf="--browser --regexp --es5 --nomen --evil --eqeq --plusplus --continue --forin --bitwise --predef define  --predef require"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'


" Addons list
let s:addon_list = [
            \'vimproc',
            \'neocomplete',
            \'unite',
            \'github:Shougo/neomru.vim',
            \'The_NERD_tree',
            \'fugitive',
            \'quickrun%3146',
            \'sudo',
            \'Tagbar',
            \'The_NERD_Commenter',
            \'Syntastic',
            \'vim-neatstatus',
            \'ctrlp',
            \'github:mbbill/fencview',
            \'github:flazz/vim-colorschemes']

call vam#ActivateAddons(s:addon_list)


" Lazy loading
let ft_addons = {
    \ 'go': ['github:uggedal/go-vim'],
    \ 'html': ['ZenCoding'],
    \ 'javascript': ['vim-jsbeautify', 'github:marijnh/tern_for_vim'],
    \ 'python': ['github:hynek/vim-python-pep8-indent'],
    \ 'less': ['vim-less'],
    \ 'haskell': ['haskellmode-vim']
    \ }
au FileType * for l in values(filter(copy(ft_addons), string(expand('<amatch>')).' =~ v:key')) | call vam#ActivateAddons(l, {'force_loading_plugins_now':1}) | endfor

" Haskell related
let g:haddock_browser = "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
au BufEnter *.hs compiler ghc
let g:ghc="/usr/bin/ghc"
let g:haddock_indexfiledir="~/.dotvim/vim-addons/haskellmode-vim/"

" TernJs
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" other settings
source $MYVIMPATH/functions.vim
source $MYVIMPATH/unite.vim
source $MYVIMPATH/neocomplete.vim
source $MYVIMPATH/keys.vim

" Remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

if has('gui_running') || $TERM=='xterm-256color'
    colorscheme Monokai-chris
else
    colorscheme evening
endif

if filereadable(expand("$MYVIMPATH/custom.vim"))
    source $MYVIMPATH/custom.vim
endif

" JSBeautify settings
let g:editorconfig_Beautifier=expand("$MYVIMPATH") . "/jsbeautifier_config"
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

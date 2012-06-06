" keybindings
" emacs like edit
imap <M-Backspace> <C-w>
cmap <M-Backspace> <C-w>

" windows operation
map <silent> <M-s> <Esc>:wincmd s <CR>
map <silent> <M-v> <Esc>:wincmd v <CR>
map <silent> <M-j> <Esc>:wincmd j <CR>
map <silent> <M-k> <Esc>:wincmd k <CR>
map <silent> <M-h> <Esc>:wincmd h <CR>
map <silent> <M-l> <Esc>:wincmd l <CR>
map <silent> <M-c> <Esc>:wincmd c <CR>

map <silent> <M-+> <Esc>:wincmd + <CR>
map <silent> <M--> <Esc>:wincmd - <CR>
map <silent> <M-<> <Esc>:wincmd < <CR>
map <silent> <M->> <Esc>:wincmd > <CR>

map <silent> <M-H> <Esc>:wincmd H <CR>
map <silent> <M-L> <Esc>:wincmd L <CR>
map <silent> <M-J> <Esc>:wincmd J <CR>
map <silent> <M-K> <Esc>:wincmd K <CR>


map <silent> <M-_> <Esc>:wincmd _ <CR>
"map <silent> <M-|> <Esc>:wincmd | <CR>
map <silent> <M-=> <Esc>:wincmd = <CR>

map <silent> <M-r> <Esc>:wincmd r <CR>
map <silent> <M-x> <Esc>:wincmd x <CR>

" tab operation
map <silent> <M-p> <Esc>:tabprevious<CR>
map <silent> <M-n> <Esc>:tabnext<CR>
map <silent> <M-S-n> <Esc>:tabnew<CR>
map <silent> <M-S-c> <Esc>:tabclose<CR>

" find files
map <silent> <C-x><C-f> <Esc>:FufFile<CR>
map <silent> <C-x><C-b> <Esc>:FufBuffer<CR>


" settings
map <silent> <M-S-p> <Esc>:e ~/.vim/init.vim<CR>
map <silent> <M-S-r> <Esc>:so ~/.vim/init.vim<CR>

" save
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>
" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" command-t
nnoremap <silent> <Leader>t :CommandT<CR>
" nnoremap <silent> <C-x>b :CommandTBuffer <CR>
let g:fuf_modesDisable = []
nnoremap <silent> <Leader>b :FufBuffer <CR>
nnoremap <silent> <Leader>f :FufFile <CR>
nnoremap <silent> <Leader>r :FufMruFile<CR>
nnoremap <silent> <Leader>c :FufMruCmd<CR>

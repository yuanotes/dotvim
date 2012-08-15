" keybindings

" save
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" command-t
nnoremap <silent> <Leader>t :CommandT<CR>

" nnoremap <silent> <C-x>b :CommandTBuffer <CR>
let g:fuf_modesDisable = []
nnoremap <silent> <Leader>f :FufFile <CR>
nnoremap <silent> <Leader>b :FufBuffer <CR>
nnoremap <silent> <Leader>r :FufMruFile<CR>
nnoremap <silent> <Leader>c :FufMruCmd<CR>

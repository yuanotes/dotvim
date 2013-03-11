" keybindings

" save
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" sudo, which is useful
cnoremap w!! w !sudo dd of=%

let g:fuf_modesDisable = []
nnoremap <silent> <C-x><C-f> :FufFile<CR>
nnoremap <silent> <C-x><C-b> :FufBuffer<CR>
nnoremap <silent> <C-x><C-r> :FufMruFile<CR>
nnoremap <silent> <C-x><C-c> :FufMruCMD<CR>

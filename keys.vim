" keybindings

" save
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" sudo, which is useful
cnoremap w!! w !sudo dd of=%

let g:ctrlp_map="<Leader>p"
noremap <Leader>r :CtrlPMRU<CR>
noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>f :CtrlPCurFile<CR>


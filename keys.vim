" keybindings

" save
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>

" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" sudo, which is useful
cnoremap w!! w !sudo dd of=%

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 200
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent> <C-x><C-f> :<C-u>:UniteWithBufferDir file/new file file_mru<CR>
nnoremap <silent> <C-x><C-b> :Unite -quick-match buffer<CR>
nnoremap <silent> <C-x>m :UniteBookmarkAdd<CR>
nnoremap <silent> <C-x><C-m> :Unite bookmark<CR>
nnoremap <silent> <C-x><C-r> :<C-u>Unite grep:./:-iR:file<CR>
nnoremap <silent> <C-x><C-y> :Unite history/yank<CR>
nnoremap <silent> <C-x><C-t> :Unite -no-start-insert tab<CR>

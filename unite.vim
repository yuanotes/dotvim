" The prefix key.
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <C-x><C-f> :<C-u>:UniteWithCurrentDir -buffer-name=files file buffer bookmark file_mru file/new<CR>
nnoremap <silent> <C-x><C-b> :<C-u>:Unite -buffer-name=files -no-split jump_point file_point buffer_tab file_rec:! file file/new<CR>
nnoremap <silent> <C-x>m :UniteBookmarkAdd<CR>
nnoremap <silent> <C-x><C-m> :Unite bookmark<CR>
nnoremap <silent> <C-x><C-r> :call MyProjectPathCommand('Unite grep:@proj_dir:-iR:', 'Unite grep:./:-iR:')<CR>
nnoremap <silent> <C-x><C-y> :Unite history/yank<CR>
nnoremap <silent> <C-x><C-t> :Unite -no-start-insert tab<CR>

" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

" Prompt choices.
"let g:unite_prompt = '❫ '
let g:unite_prompt = '» '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.

    imap <buffer> jj      <Plug>(unite_insert_leave)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

if executable('jvgrep')
    " For jvgrep.
    "let g:unite_source_grep_command = 'jvgrep'
    "let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    "let g:unite_source_grep_recursive_opt = '-R'
endif

" For ack.
if executable('ack-grep')
    " let g:unite_source_grep_command = 'ack-grep'
    " let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
    " let g:unite_source_grep_recursive_opt = ''
endif

function! MyGetProjectPath(path)
python << EOF
import os
import vim
def get_project_dir(path):
    find_project_file = False
    while not find_project_file:
        files = os.listdir(path)
        if ".vimproj" in files:
            find_project_file = True
        elif ".git" in files and os.listdir(os.path.join(path, ".git")):
            find_project_file = True
        else:
            path = os.path.dirname(path)
            if path == os.getenv("HOME") or path == "/":
                return None
    return path
proj_dir = get_project_dir(vim.eval("a:path"))
vim.command("let g:vim_proj_dir=\"%s\"" % (proj_dir or "0"))
EOF
endfunction

function! MyCallCommandT()
    let l:cur_dir = expand("%:p:h") 
    call MyGetProjectPath(l:cur_dir)
    if exists("g:vim_proj_dir") && !empty(g:vim_proj_dir)
        execute "CommandT ".g:vim_proj_dir
    else
        execute "CommandT ./"
    endif
endfunction
nnoremap <silent> <Leader>t  :call MyCallCommandT()<CR>



" Wrap fugitive to push 
command! Gpush VimProcBang git push origin

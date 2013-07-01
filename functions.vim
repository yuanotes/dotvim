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
if proj_dir:
    vim.command("let g:vim_proj_dir=\"%s\"" % proj_dir)
else:
    vim.command("let g:vim_proj_dir=0")

EOF
endfunction

function! MyProjectPathCommand(command_string, command_string_alt)
    let l:cur_dir = expand("%:p:h") 
    call MyGetProjectPath(l:cur_dir)
    echo g:vim_proj_dir
    if exists("g:vim_proj_dir") && !empty(g:vim_proj_dir)
        let l:command_str = substitute(a:command_string, '@proj_dir', g:vim_proj_dir, 'g')
        execute l:command_str
    else
        execute a:command_string_alt
    endif
endfunction


" Wrap fugitive to push 
command! Gpush VimProcBang git push origin

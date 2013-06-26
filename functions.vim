function! SetProjectPath()
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
cur_dir = os.getcwd()
proj_dir = get_project_dir(cur_dir)
try:
    vim.command("let g:vim_proj_dir=\"%s\"" % (proj_dir or "0"))
except:
    pass
EOF

if exists("g:vim_proj_dir") && g:vim_proj_dir
    nmap <silent> <Leader>t  :CommandT g:vim_proj_dir<CR>
else
    nmap <silent> <Leader>t  :CommandT ./<CR>
endif
endfunction

call SetProjectPath()

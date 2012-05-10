fun! EnsureVamIsOnDisk(vam_install_path)
    " windows users want to use http://mawercer.de/~marc/vam/index.php
    " to fetch VAM, VAM-known-repositories and the listed plugins
    " without having to install curl, unzip, git tool chain first
    " -> BUG [4] (git-less installation)
    if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
    \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    " I'm sorry having to add this reminder. Eventually it'll pay off.
    call confirm("Remind yourself that most plugins ship with ".
            \"documentation (README*, doc/*.txt). It is your ".
            \"first source of knowledge. If you can't find ".
            \"the info you're looking for in reasonable ".
            \"time ask maintainers to improve documentation")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    " VAM runs helptags automatically when you install or update 
    " plugins
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
    endf

fun! SetupVAM()
    " Set advanced options like this:
    " let g:vim_addon_manager = {}
    " let g:vim_addon_manager['key'] = value

    " Example: drop git sources unless git is in PATH. Same plugins can
    " be installed from www.vim.org. Lookup MergeSources to get more control
    " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

    " VAM install location:
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
call EnsureVamIsOnDisk(vam_install_path)
    exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

    " Tell VAM which plugins to fetch & load:
    call vam#ActivateAddons([], {'auto_install' : 0})
    " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

    " Addons are put into vam_install_path/plugin-name directory
    " unless those directories exist. Then they are activated.
    " Activating means adding addon dirs to rtp and do some additional
    " magic

    " How to find addon names?
    " - look up source from pool
    " - (<c-x><c-p> complete plugin names):
    " You can use name rewritings to point to sources:
    "    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
    "    ..ActivateAddons(["github:user/repo", .. => github://user/repo
    " Also see section "2.2. names of addons and addon sources" in VAM's documentation
    endfun
call SetupVAM()
    " experimental [E1]: load plugins lazily depending on filetype, See
    " NOTES
    " experimental [E2]: run after gui has been started (gvim) [3]
    " option1:  au VimEnter * call SetupVAM()
    " option2:  au GUIEnter * call SetupVAM()
    " See BUGS sections below [*]
    " Vim 7.0 users see BUGS section [3]
call vam#ActivateAddons(['Command-T'],{'auto_install':1})
call vam#ActivateAddons(['Python-mode-klen','fugitive', 'VimOrganizer','Zenburn','vim-less','Powerline','Tagbar'], {'auto_install':1})
call vam#ActivateAddons(['vimproc','neocomplcache','neocomplcache-snippets_complete'], {'auto_install':1})
call vam#ActivateAddons(['L9','FuzzyFinder','YankRing'], {'auto_install':1})
call vam#ActivateAddons(['ZenCoding'],{'auto_install':1})
call vam#ActivateAddons(['vim-jsbeautify'],{'auto_install':1})
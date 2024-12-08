" https://stackoverflow.com/a/6052704

" On entering Vim do the following:
" If Vim is started without file arguments, then try to open a session. 
" If we opened a session, then set a global flag.
" If Vim is start *with* file arguments, then we treat this as a one-off edit
" which shouldn't affect the existing session save.
" Regardless of a session was opened, open NERDTree.
fun! RestoreSess()
    if filereadable(getcwd() . '/.session.vim')
        exec 'so ' . getcwd() . '/.session.vim'
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
endfun
autocmd StdinReadPre * let s:std_in=1
fun! RestoreSessWrapper()
    if argc() == 0 && !exists('s:std_in')
        call RestoreSess()
        let g:working_on_restored_session = 1
    endif
endfun
autocmd VimEnter * nested call RestoreSessWrapper()
autocmd VimEnter * NERDTreeToggle | wincmd p

" On exiting Vim, first close NERDTree. Then, if the current environment was
" due to a session, overwrite the session file.
fun! SaveSess()
    let l:path = getcwd() . '/.session.vim'
    if filereadable(l:path)
        execute 'mksession! ' . l:path
    else
        call inputsave()
        let l:choice = input('Save session to ' . l:path . '? (enter "save" to save) ')
        call inputrestore()
        if l:choice ==? 'save'
            execute 'mksession! ' . l:path
        endif
    endif
endfun
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * if get(g:, 'working_on_restored_session', v:false) | call SaveSess() | endif
" autocmd BufLeave * 

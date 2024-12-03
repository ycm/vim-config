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
fu! RestoreSessWrapper()
    if argc() == 0 && !exists('s:std_in')
        call RestoreSess()
        let g:working_on_restored_session = 1
    endif
endfun
autocmd VimEnter * nested call RestoreSessWrapper()

" <HACK> NERDTree resizing messes with statusline
" autocmd VimEnter * NERDTreeToggle | wincmd p | call feedkeys("\<C-c>jk")

" On exiting Vim, first close NERDTree. Then, if the current environment was
" due to a session, overwrite the session file.
fun! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfun
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * if exists('g:working_on_restored_session') | call SaveSess() | endif

" If NERDTree is the last file open, then exit out of Vim.
" <HACK> NERDTree changes the alternate file, so use CtrlPBuffers to quickly open up
" a Buffer, and :wqa.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(" b\<CR>:wqa\<CR>\<BS>") | endif

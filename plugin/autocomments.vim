function! ToggleSingleLineComment(comment_string)
    let l:line = getline('.')
    let l:trimmed = trim(l:line)
    if l:trimmed =~ '^' . a:comment_string
        let l:uncommented = substitute(l:line, escape(a:comment_string, '/') . ' ', '', '')
        call setline('.', l:uncommented)
    else
        let l:commented = substitute(l:line, '^\(\s*\)', '\1' . a:comment_string . ' ', '')
        call setline('.', l:commented)
    endif
endfunction

function! ToggleBlockComment(comment_string)
    let l:all_lines_commented = 1
    for l:i in range(line("'<"), line("'>"))
        if !(trim(getline(l:i)) =~ '^' . a:comment_string)
            let l:all_lines_commented = 0
        endif
    endfor
    if l:all_lines_commented
        " only uncomment on last function call
        if line("'>") == line('.')
            for l:i in range(line("'<"), line("'>"))
                let l:line = getline(l:i)
                let l:trimmed = trim(l:line)
                if l:trimmed =~ '^' . a:comment_string . ' '
                    let l:uncommented = substitute(l:line, escape(a:comment_string, '/') . ' ', '', '')
                elseif l:trimmed =~ '^' . a:comment_string
                    let l:uncommented = substitute(l:line, escape(a:comment_string, '/'), '', '')
                endif
                call setline(l:i, l:uncommented)
            endfor
        endif
        return
    endif

    let l:min_indent = 1000
    for l:i in range(line("'<"), line("'>"))
        if indent(l:i) < l:min_indent
            let l:min_indent = indent(l:i)
        endif
    endfor
    let l:line = getline('.')
    let l:commented = repeat(' ', l:min_indent) . a:comment_string . ' ' . strpart(l:line, l:min_indent)
    call setline('.', l:commented)
endfunction

augroup CommentSingleLineGroup
    autocmd!
    autocmd FileType cpp,h nnoremap <buffer> gcc :call ToggleSingleLineComment('//')<CR>
    autocmd FileType vim nnoremap <buffer> gcc :call ToggleSingleLineComment('"')<CR>
    autocmd FileType python nnoremap <buffer> gcc :call ToggleSingleLineComment('#')<CR>
augroup END

augroup CommentVisualLinesGroup
    autocmd!
    autocmd FileType cpp,h vnoremap gc :call ToggleBlockComment('//')<CR>
    autocmd FileType vim vnoremap gc :call ToggleBlockComment('"')<CR>
    autocmd FileType python vnoremap gc :call ToggleBlockComment('#')<CR>
augroup END

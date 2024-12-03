def ToggleSingleLineComment(comment_string: string)
    var line = getline('.')
    var trimmed = trim(line)
    if trimmed =~ '^' .. comment_string
        var uncommented = substitute(line, escape(comment_string, '/') .. ' ', '', '')
        setline('.', uncommented)
    else
        var commented = substitute(line, '^\(\s*\)', '\1' .. comment_string .. ' ', '')
        setline('.', commented)
    endif
enddef

def ToggleBlockComment(comment_string: string)
    var all_lines_commented = 1
    for i in range(line("'<"), line("'>"))
        if !(trim(getline(i)) =~ '^' .. comment_string)
            all_lines_commented = 0
        endif
    endfor
    if all_lines_commented
        # only uncomment on last function call
        if line("'>") == line('.')
            for i in range(line("'<"), line("'>"))
                var line = getline(i)
                var trimmed = trim(line)
                var uncommented = ""
                if trimmed =~ '^' .. comment_string .. ' '
                    uncommented = substitute(line, escape(comment_string, '/') .. ' ', '', '')
                elseif trimmed =~ '^' .. comment_string
                    uncommented = substitute(line, escape(comment_string, '/'), '', '')
                endif
                setline(i, uncommented)
            endfor
        endif
        return
    endif
    var min_indent = 1000
    for i in range(line("'<"), line("'>"))
        if indent(i) < min_indent
            min_indent = indent(i)
        endif
    endfor
    var line = getline('.')
    var commented = repeat(' ', min_indent) .. comment_string .. ' ' .. strpart(line, min_indent)
    setline('.', commented)
enddef

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

vim9script
# augroup Vim9ScriptComments
#     autocmd!
#     autocmd BufReadPost,BufNewFile * if getline(1) =~ 'vim9script' |
#         \ execute "nnoremap <buffer> <silent> gcc :call ToggleSingleLineComment('#')<CR>" | endif
#     autocmd BufReadPost,BufNewFile * if getline(1) =~ 'vim9script' |
#         \ execute "vnoremap <buffer> <silent> gc :call ToggleBlockComment('#')<CR>" | endif
# augroup END

# def ToggleSingleLineComment(comment_string: string)
#     var line = getline('.')
#     var trimmed = trim(line)
#     if trimmed =~ '^' .. comment_string
#         var uncommented = substitute(line, escape(comment_string, '/') .. ' ', '', '')
#         setline('.', uncommented)
#     else
#         var commented = substitute(line, '^\(\s*\)', '\1' .. comment_string .. ' ', '')
#         setline('.', commented)
#     endif
# enddef

# def ToggleBlockComment(comment_string: string)
#     var all_lines_commented = 1
#     for i in range(line("'<"), line("'>"))
#         if !(trim(getline(i)) =~ '^' .. comment_string)
#             all_lines_commented = 0
#         endif
#     endfor
#     if all_lines_commented
#         if line("'>") == line('.')
#             for i in range(line("'<"), line("'>"))
#                 var line = getline(i)
#                 var trimmed = trim(line)
#                 if trimmed =~ '^' .. comment_string .. ' '
#                     setline(i, substitute(line, escape(comment_string, '/') .. ' ', '', ''))
#                 elseif trimmed =~ '^' .. comment_string
#                     setline(i, substitute(line, escape(comment_string, '/'), '', ''))
#                 endif
#             endfor
#         endif
#         return
#     endif
#     var min_indent = 1000
#     for i in range(line("'<"), line("'>"))
#         if indent(i) < min_indent
#             min_indent = indent(i)
#         endif
#     endfor
#     var line = getline('.')
#     var commented = repeat(' ', min_indent) .. comment_string .. ' ' .. strpart(line, min_indent)
#     setline('.', commented)
# enddef

# augroup CommentSingleLineGroup
#     autocmd!
#     autocmd FileType cpp,h nnoremap <buffer> <silent> gcc :call ToggleSingleLineComment('//')<CR>
#     autocmd FileType vim nnoremap <buffer> <silent> gcc :call ToggleSingleLineComment('"')<CR>
#     autocmd FileType python nnoremap <buffer> <silent> gcc :call ToggleSingleLineComment('#')<CR>
# augroup END

# augroup CommentVisualLinesGroup
#     autocmd!
#     autocmd FileType cpp,h vnoremap <buffer> <silent> gc :call ToggleBlockComment('//')<CR>
#     autocmd FileType vim vnoremap <buffer> <silent> gc :call ToggleBlockComment('"')<CR>
#     autocmd FileType python vnoremap <buffer> <silent> gc :call ToggleBlockComment('#')<CR>
# augroup END

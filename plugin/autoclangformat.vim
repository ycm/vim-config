augroup AutoClangFormatGroup
    autocmd!
    autocmd FileType cpp,h nnoremap <buffer> <C-s> :let pos = getpos('.')<CR>:%!clang-format<CR>:call setpos('.', pos)<CR>:w<CR>
augroup END

augroup TodoLabelsGroup
    autocmd!
    autocmd FileType * highlight TodoLabel  ctermbg=black ctermfg=075 cterm=bold,italic,reverse
    autocmd FileType * highlight FixLabel   ctermbg=black ctermfg=202 cterm=bold,italic,reverse
    autocmd FileType * highlight DebugLabel ctermbg=black ctermfg=213 cterm=bold,italic,reverse
    autocmd FileType * highlight WarnLabel  ctermbg=black ctermfg=221 cterm=bold,italic,reverse
    autocmd FileType * highlight InfoLabel  ctermbg=black ctermfg=252 cterm=bold,italic,reverse
    autocmd BufRead,BufNewFile *.cpp call MatchTodoLabels()
augroup END

function! MatchTodoLabels()
    call matchadd('TodoLabel', '<TODO>')

    call matchadd('FixLabel', '<FIX>')

    call matchadd('DebugLabel', '<DEBUG>')

    call matchadd('WarnLabel', '<WARN>')
    call matchadd('WarnLabel', '<HACK>')

    call matchadd('InfoLabel', '<INFO>')
    call matchadd('InfoLabel', '<NOTE>')
endfunction

vim9script


def MatchTodoLabels()
    call matchadd('GenericBluePop',    '<TODO>')
    call matchadd('GenericRedPop',     '<FIX>')
    call matchadd('GenericMagentaPop', '<DEBUG>')
    call matchadd('GenericYellowPop',  '<WARN>')
    call matchadd('GenericYellowPop',  '<HACK>')
    call matchadd('GenericGreenPop',   '<INFO>')
    call matchadd('GenericGreenPop',   '<NOTE>')
    call matchadd('GenericGreenPop',   '<DONE>')
enddef

augroup TodoLabelsGroup
    autocmd!
    # autocmd FileType * highlight TodoLabel  ctermbg=black ctermfg=075 cterm=bold,italic,reverse
    # autocmd FileType * highlight FixLabel   ctermbg=black ctermfg=202 cterm=bold,italic,reverse
    # autocmd FileType * highlight DebugLabel ctermbg=black ctermfg=213 cterm=bold,italic,reverse
    # autocmd FileType * highlight WarnLabel  ctermbg=black ctermfg=221 cterm=bold,italic,reverse
    # autocmd FileType * highlight InfoLabel  ctermbg=black ctermfg=252 cterm=bold,italic,reverse
    autocmd BufRead,BufNewFile *.cpp,*.h,*.vim,*.py call MatchTodoLabels()
augroup END

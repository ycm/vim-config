vim9script

if !'GenericBluePop'->hlexists()
    if &background ==? 'dark'
        hi GenericRedPop ctermfg=131 ctermbg=235 cterm=bold,italic
        hi GenericGreenPop ctermfg=71 ctermbg=235 cterm=bold,italic
        hi GenericYellowPop ctermfg=137 ctermbg=236 cterm=bold,italic
        hi GenericBluePop ctermfg=110 ctermbg=235 cterm=bold,italic
        hi GenericMagentaPop ctermfg=133 ctermbg=235 cterm=bold,italic
        hi GenericCyanPop ctermfg=72 ctermbg=235 cterm=bold,italic
    else
        hi GenericRedPop ctermfg=160 ctermbg=217 cterm=bold,italic
        hi GenericGreenPop ctermfg=28 ctermbg=194 cterm=bold,italic
        hi GenericYellowPop ctermfg=100 ctermbg=229 cterm=bold,italic
        hi GenericBluePop ctermfg=26 ctermbg=153 cterm=bold,italic
        hi GenericMagentaPop ctermfg=91 ctermbg=255 cterm=bold,italic
        hi GenericCyanPop ctermfg=65 ctermbg=254 cterm=bold,italic
    endif
endif

def MatchTodoLabels()
    matchadd('GenericBluePop',    '<TODO>')
    matchadd('GenericRedPop',     '<FIX>')
    matchadd('GenericMagentaPop', '<DEBUG>')
    matchadd('GenericYellowPop',  '<WARN>')
    matchadd('GenericYellowPop',  '<HACK>')
    matchadd('GenericGreenPop',   '<INFO>')
    matchadd('GenericGreenPop',   '<NOTE>')
    matchadd('GenericGreenPop',   '<DONE>')
enddef

augroup TodoLabelsGroup
    autocmd!
    autocmd BufRead,BufNewFile *.cpp,*.h,*.vim,*.py call MatchTodoLabels()
augroup END

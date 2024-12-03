" <NOTE> In .bashrc, export BAT_THEME='gruvbox-light' or some light color

hi FZFCurrItem guifg=#220000
hi FZFSearchHighlight guifg=#cc0000 

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 'rg --line-number ' . fzf#shellescape(<q-args>),
    \ fzf#vim#with_preview(),
    \ <bang>0)

let g:fzf_vim = {}
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'FZFSearchHighlight'],
    \ 'fg+':     ['fg', 'FZFCurrItem'],
    \ 'bg+':     ['bg', 'CursorLine'],
    \ 'hl+':     ['fg', 'FZFSearchHighlight']}

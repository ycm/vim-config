vim9script

hi FZFCurrItemLight guifg=#220000
hi FZFCurrItemDark guifg=white
hi FZFSearchHighlightLight guifg=#cc0000 
hi FZFSearchHighlightDark guifg=#49740e
hi FZFPreviewBg guibg=#333333
hi FZFPointerLight guibg=#cc0000
hi FZFPointerDark guibg=#49740e

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column  --no-heading --smart-case -- " .. fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)

g:fzf_vim = {}
if &background == 'light' 
    g:fzf_colors = {
        'fg':         ['fg', 'Normal'],
        'hl':         ['fg', 'FZFSearchHighlightLight'],
        'bg':         ['bg', 'Normal'],
        'fg+':        ['fg', 'FZFCurrItemLight'],
        'bg+':        ['bg', 'CursorLine'],
        'hl+':        ['fg', 'FZFSearchHighlightLight'],
        'gutter':     ['bg', 'Normal'],
        'pointer':    ['bg', 'FZFPointerLight'],
        'preview-bg': ['bg', 'FZFPreviewBg']}
else
    g:fzf_colors = {
        'fg':         ['fg', 'Normal'],
        'hl':         ['fg', 'FZFSearchHighlightDark'],
        'bg':         ['bg', 'Normal'],
        'fg+':        ['fg', 'FZFCurrItemDark'],
        'bg+':        ['bg', 'CursorLine'],
        'hl+':        ['fg', 'FZFSearchHighlightDark'],
        'gutter':     ['bg', 'Normal'],
        'pointer':    ['bg', 'FZFPointerDark'],
        'preview-bg': ['bg', 'FZFPreviewBg']}
endif

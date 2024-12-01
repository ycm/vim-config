set background=light

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="ycm_minimal_colors"

hi Character        ctermfg=90     ctermbg=none     cterm=none
hi String           ctermfg=90     ctermbg=none     cterm=none

hi Boolean          ctermfg=160    ctermbg=none     cterm=none
hi ColorColumn      ctermfg=none   ctermbg=none     cterm=none
hi Comment          ctermfg=240    ctermbg=none     cterm=none
hi Constant         ctermfg=none   ctermbg=none     cterm=none
hi CurSearch        ctermfg=none   ctermbg=158      cterm=none
hi Cursor           ctermfg=none   ctermbg=none     cterm=none
hi CursorLine       ctermfg=none   ctermbg=255      cterm=none
hi CursorLineNR     ctermfg=none   ctermbg=none     cterm=none
hi Define           ctermfg=160    ctermbg=none     cterm=none
hi Directory        ctermfg=none   ctermbg=none     cterm=none
hi Float            ctermfg=none   ctermbg=none     cterm=none
hi Function         ctermfg=none   ctermbg=none     cterm=none
hi Identifier       ctermfg=none   ctermbg=none     cterm=none
hi Include          ctermfg=160    ctermbg=none     cterm=none
hi IncSearch        ctermfg=none   ctermbg=158      cterm=none
hi Keyword          ctermfg=160    ctermbg=none     cterm=none
hi LineNr           ctermfg=240    ctermbg=none     cterm=none
hi Macro            ctermfg=160    ctermbg=none     cterm=none
hi MatchParen       ctermfg=none   ctermbg=228      cterm=none
hi Normal           ctermfg=none   ctermbg=none     cterm=none
hi Number           ctermfg=27     ctermbg=none     cterm=none
hi PreProc          ctermfg=160    ctermbg=none     cterm=none
hi Search           ctermfg=none   ctermbg=225      cterm=none
hi Special          ctermfg=none   ctermbg=none     cterm=none
hi SpellBad         ctermfg=none   ctermbg=none     cterm=reverse
hi Statement        ctermfg=160    ctermbg=none     cterm=none
hi StorageClass     ctermfg=160    ctermbg=none     cterm=none
hi Type             ctermfg=160    ctermbg=none     cterm=none
hi Visual           ctermfg=none   ctermbg=194      cterm=none

hi vimHiKeyError    ctermfg=none   ctermbg=none     cterm=underline
hi vimHiAttribList  ctermfg=none   ctermbg=none     cterm=underline
hi vimHiCTermError  ctermfg=none   ctermbg=none     cterm=underline

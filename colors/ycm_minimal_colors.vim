set background=light

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="ycm_minimal_colors"

hi      Character       ctermfg=90      ctermbg=none    cterm=none      guifg=#660066
hi      String          ctermfg=90      ctermbg=none    cterm=none      guifg=#660066
hi      Boolean         ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      ColorColumn     ctermfg=none    ctermbg=none    cterm=none      
hi      Comment         ctermfg=240     ctermbg=none    cterm=none      guifg=#585858
hi      Constant        ctermfg=none    ctermbg=none    cterm=none      
hi      CurSearch       ctermfg=none    ctermbg=158     cterm=none                      guibg=#99ffcc
hi      Cursor          ctermfg=none    ctermbg=none    cterm=none      
hi      CursorLine      ctermfg=none    ctermbg=255     cterm=none                      guibg=#eeeeee
hi      CursorLineNR    ctermfg=none    ctermbg=none    cterm=none      
hi      Define          ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      Directory       ctermfg=none    ctermbg=none    cterm=none      
hi      Float           ctermfg=none    ctermbg=none    cterm=none      
hi      Function        ctermfg=none    ctermbg=none    cterm=none      
hi      Identifier      ctermfg=none    ctermbg=none    cterm=none      
hi      Include         ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      IncSearch       ctermfg=none    ctermbg=158     cterm=none                      guibg=#99ffcc
hi      Keyword         ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      LineNr          ctermfg=240     ctermbg=none    cterm=none      guifg=#585858
hi      Macro           ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      MatchParen      ctermfg=none    ctermbg=228     cterm=none                      guibg=#ffff66
hi      Normal          ctermfg=none    ctermbg=none    cterm=none      
hi      Number          ctermfg=27      ctermbg=none    cterm=none      guifg=#005fff
hi      PreProc         ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      Search          ctermfg=none    ctermbg=225     cterm=none                      guibg=#ffccff
hi      SignColumn                      guibg=white     cterm=none      
hi      Special         ctermfg=none    ctermbg=none    cterm=none      
hi      SpellBad        ctermfg=none    ctermbg=none    cterm=reverse                                  gui=reverse
hi      Statement       ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      StorageClass    ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      Type            ctermfg=160     ctermbg=none    cterm=none      guifg=#cc0000
hi      Visual          ctermfg=none    ctermbg=194     cterm=none                      guibg=#cbe8f2

hi      VertSplit                                       cterm=none
set fillchars+=vert:\▏

hi      vimHiKeyError   ctermfg=none    ctermbg=none    cterm=underline 
hi      vimHiAttribList ctermfg=none    ctermbg=none    cterm=underline 
hi      vimHiCTermError ctermfg=none    ctermbg=none    cterm=underline 
hi      vimVar          ctermfg=none    ctermbg=none    cterm=none 
hi link vimHiCTermColor Number
hi link vimNotation Number
hi link vimMapModKey vimNotation
hi      vimEscape       ctermfg=90                      cterm=bold

hi NERDTreeDir         ctermfg=27      ctermbg=none    cterm=bold 
hi NERDTreeHelpKey     ctermfg=027                     cterm=bold
hi NERDTreeHelpCommand ctermfg=027
hi NERDTreeHelpTitle   ctermfg=027                     cterm=bold,italic
hi NERDTreeCWD         ctermfg=242                     cterm=italic
hi NERDTreeToggleOn    ctermfg=028                     cterm=bold
hi NERDTreeToggleOff   ctermfg=160                     cterm=bold
hi NERDTreeExecFile    ctermfg=035                     cterm=bold

hi link NERDTreeHelp     Normal
hi link NERDTreeOpenable NERDTreeDir
hi link NERDTreeClosable NERDTreeDir
hi link NERDTreeUp       NERDTreeDir
hi link NERDTreeDirSlash NERDTreeDir

hi ALEError              guibg=#f7b39e
hi ALEErrorSign          guifg=#b25740 cterm=bold,italic
hi ALEVirtualTextError   guifg=#b25740 cterm=italic
hi ALEWarning            guibg=#ede3aa
hi ALEWarningSign        guifg=#b28e40 cterm=bold,italic
hi ALEVirtualTextWarning guifg=#b28e40 cterm=italic

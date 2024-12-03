set background=light

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="ycm_minimal_colors"

" CUSTOM STATUSLINE
hi StatusLine            ctermfg=15    ctermbg=237  cterm=bold,italic
hi StatusLineNC          ctermfg=250   ctermbg=242  cterm=bold,italic
hi STLNormalMode         ctermfg=white ctermbg=130  cterm=bold,italic
hi STLInsertMode         ctermfg=white ctermbg=028  cterm=bold,italic
hi STLVisualMode         ctermfg=white ctermbg=092  cterm=bold,italic
hi STLTerminalMode       ctermfg=white ctermbg=037  cterm=bold,italic
hi STLCommandMode        ctermfg=black ctermbg=003  cterm=bold,italic
hi STLReplaceMode        ctermfg=white ctermbg=203  cterm=bold,italic
hi STLGitBranch          ctermfg=white ctermbg=024  cterm=bold,italic
hi BlackOnYellowPop      ctermfg=black ctermbg=003  cterm=bold,italic
hi WhiteOnTealPop        ctermfg=white ctermbg=037  cterm=bold,italic

" GENERAL HIGHLIGHTS
hi Character             ctermfg=90    ctermbg=none cterm=none             guifg=#660066
hi String                ctermfg=90    ctermbg=none cterm=none             guifg=#660066
hi Boolean               ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi ColorColumn           ctermfg=none  ctermbg=none cterm=none
hi Comment               ctermfg=240   ctermbg=none cterm=none             guifg=#585858
hi Constant              ctermfg=none  ctermbg=none cterm=none             guifg=#cc0000
hi CurSearch             ctermfg=none  ctermbg=158  cterm=none                           guibg=#99ffcc
hi CursorLine            ctermfg=none  ctermbg=255  cterm=none                           guibg=#eeeeee
hi CursorLineNR          ctermfg=none  ctermbg=none cterm=none
hi Define                ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi Directory             ctermfg=none  ctermbg=none cterm=none
hi Error                                            cterm=bold,italic      guifg=#222222 guibg=#f7b39e
hi Float                 ctermfg=none  ctermbg=none cterm=none
hi Function              ctermfg=none  ctermbg=none cterm=none
hi Include               ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi IncSearch             ctermfg=none  ctermbg=158  cterm=none                           guibg=#99ffcc
hi Keyword               ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi LineNr                ctermfg=240   ctermbg=none cterm=none             guifg=#585858
hi Macro                 ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi MatchParen            ctermfg=none  ctermbg=228  cterm=none                           guibg=#ffff66
hi Normal                ctermfg=none  ctermbg=none cterm=none
hi Number                ctermfg=27    ctermbg=none cterm=none             guifg=#005fff
hi PreProc               ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi Search                ctermfg=none  ctermbg=225  cterm=none                           guibg=#ffccff
hi SignColumn                                       cterm=none                           guibg=white
hi SpellBad              ctermfg=none  ctermbg=none cterm=reverse                                      gui=reverse
hi Statement             ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi StorageClass          ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi Type                  ctermfg=160   ctermbg=none cterm=none             guifg=#cc0000
hi Visual                ctermfg=none  ctermbg=194  cterm=none                           guibg=#cbe8f2

hi link Escape                    String
hi link Special                   String
hi link ErrorMsg                  Error
hi link Identifier                Keyword
hi link Delimiter                 Normal
hi link Todo                      Normal
hi link Variable                  Normal
hi link Wildmenu                  STLCommandMode

" SPLITS
hi VertSplit                                        cterm=none
set fillchars+=vert:\▏

" FILETYPE-SPECIFIC
hi link cppConstant               Keyword
hi link pythonBuiltin             Keyword
hi link pythonEscape              Escape
hi link cssColor                  Number
hi link cssVendor                 Normal
hi link javaScript                Normal
hi link sqlKeyword                Keyword
hi link shSetList                 Normal
hi link shQuote                   String
hi link shCommandSub              Number
hi link shRange                   Normal

hi vimHiKeyError         ctermfg=none  ctermbg=none cterm=underline
hi vimHiAttribList       ctermfg=none  ctermbg=none cterm=underline
hi vimHiCTermError       ctermfg=none  ctermbg=none cterm=underline
hi link vimVar                    Keyword
hi link vimFuncVar                vimVar
hi link vimHiCTermColor           Number
hi link vimNotation               Number
hi link vimBracket                vimNotation
hi link vimMapModKey              vimNotation
hi link vimEscape                 Escape

hi markdownH1            ctermfg=36                 cterm=bold,italic
hi markdownUrl           ctermfg=39                 cterm=italic,underline
hi markdownLinkDelimiter ctermfg=39                 cterm=italic
hi link markdownH2                markdownH1
hi link markdownH3                markdownH1
hi link markdownH4                markdownH1
hi link markdownH5                markdownH1
hi link markdownH6                markdownH1
hi link markdownH1Delimiter       markdownH1
hi link markdownH2Delimiter       markdownH1
hi link markdownH3Delimiter       markdownH1
hi link markdownH4Delimiter       markdownH1
hi link markdownH5Delimiter       markdownH1
hi link markdownH6Delimiter       markdownH1
hi link markdownLinkTextDelimiter markdownLinkDelimiter

" PLUGIN-SPECIFIC
hi NERDTreeDir           ctermfg=27    ctermbg=none cterm=bold
hi NERDTreeHelpKey       ctermfg=027                cterm=bold
hi NERDTreeHelpCommand   ctermfg=027
hi NERDTreeHelpTitle     ctermfg=027                cterm=bold,italic
hi NERDTreeCWD           ctermfg=242                cterm=italic
hi NERDTreeToggleOn      ctermfg=028                cterm=bold
hi NERDTreeToggleOff     ctermfg=160                cterm=bold
hi NERDTreeExecFile      ctermfg=035                cterm=bold

hi link NERDTreeHelp              Normal
hi link NERDTreeOpenable          NERDTreeDir
hi link NERDTreeClosable          NERDTreeDir
hi link NERDTreeBookmark          NERDTreeDir
hi link NERDTreeBookmarksName     NERDTreeDir
hi link NERDTreeBookmarksLeader   NERDTreeDir
hi link NERDTreeUp                NERDTreeDir
hi link NERDTreeDirSlash          NERDTreeDir

hi ALEError                                                                              guibg=#f7b39e
hi ALEErrorSign                                     cterm=bold,italic      guifg=#b25740
hi ALEVirtualTextError                              cterm=italic           guifg=#b25740
hi ALEWarning                                                                            guibg=#ede3aa
hi ALEWarningSign                                   cterm=bold,italic      guifg=#b28e40
hi ALEVirtualTextWarning                            cterm=italic           guifg=#b28e40

hi link CtrlPMode1                StatusLine
hi link CtrlPMode2                BlackOnYellowPop
hi link CtrlPNoEntries            CtrlPMode1

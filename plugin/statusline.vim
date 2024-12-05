set laststatus=2 " always show statusline
 
fun! StatusLineModeStringMaker(wid)
    let l:indic = ''
    let l:is_term = 0
    if a:wid == win_getid()
        if mode() == 'n'
            let l:indic = l:indic . "%#STLNormalMode# 一般 "
        elseif mode() == 'i'
            let l:indic = l:indic . "%#STLInsertMode# 插入 "
        elseif mode() == 't'
            let l:indic = l:indic . "%#STLTerminalMode# 終端 "
            let l:is_term = 1
        elseif mode() == 'c'
            let l:indic = l:indic . "%#STLCommandMode# 命令 "
        elseif mode() == "\<C-V>"
            let l:indic = l:indic . "%#STLVisualMode# 區磈 "
        elseif mode() ==# 'V'
            let l:indic = l:indic . "%#STLVisualMode# 選行 "
        elseif mode() ==# 'v'
            let l:indic = l:indic . "%#STLVisualMode# 可視 "
        elseif mode() == 'r'
            let l:indic = l:indic . "%#STLReplaceMode# 替換 "
        endif
        if l:is_term
            return l:indic . "%#StatusLineTerm#"
        endif
        return l:indic . "%#StatusLine#"
    endif
    if mode() == 't'
        return "%#StatusLineTermNC#"
    endif
    return "%#StatusLineNC# "
endfun

fun! StatusLineSessionStringMaker(wid)
    if a:wid == win_getid()
        let l:indic = ''
        if exists('g:working_on_restored_session')
            let l:indic = l:indic . "%#WhiteOnTealPop# 會話中 "
        else
            let l:indic = l:indic . "%#BlackOnYellowPop# 無會話 "
        endif
        if mode() == 't'
            return l:indic . "%#StatusLineTerm#"
        endif
        return l:indic . "%#StatusLine#"
    endif
    return ""
endfun

fun! StatusLineWrapper() abort
    let l:wid = win_getid()
    return "%{%StatusLineModeStringMaker(" . l:wid . ")%}" . "\ %r\ %f\ %m%=%{%StatusLineSessionStringMaker(" . l:wid . ")%}" . "\ %l/%L\ "
endfun
 
set statusline=%!StatusLineWrapper()
" set statusline=

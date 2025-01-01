vim9script

# Delete hidden buffers ---------------------------------------------------- {{{
def DeleteHiddenBuffers()
    var bufs = getbufinfo()
            ->mapnew((_, b) => [b.bufnr, b.name->fnamemodify(':~:.')])
            ->filter((_, n) => n[0]->win_findbuf()->empty())
    var deleted: list<string> = []
    var ct = 0
    for [nr, name] in bufs
        try
            silent execute $'bdelete {nr}'
            deleted->add(name)
            ++ct
        catch /E516/
        endtry
    endfor
    echomsg $"Closed {ct} buffers: {deleted->join(', ')}"
enddef
command! DeleteHiddenBuffers DeleteHiddenBuffers()
# }}}

# Show highlight group under cursor ---------------------------------------- {{{
def ShowHighlightGroup()
    var hi = synIDattr(synID(line("."), col("."), 1), "name")
    var trans = synIDattr(synID(line("."), col("."), 0), "name")
    var lo = synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
    echomsg $'hi<{hi}> --> trans<{trans}> --> lo<{lo}>'
enddef
command! ShowHighlightGroup ShowHighlightGroup()
# }}}

# Go away and come back ---------------------------------------------------- {{{
# cf. https://stackoverflow.com/a/6052704
def RestoreSess()
    if $'{getcwd()}/.session.vim'->filereadable()
        execute $'source {getcwd()}/.session.vim'
    endif
    g:working_on_restored_session = 1
enddef
autocmd VimEnter * ++nested RestoreSess()

def SaveSess()
    var path = $'{getcwd()}/.session.vim'
    if path->filereadable()
        execute $'mksession! {path}'
    else
        inputsave()
        var choice = $'Save session to {path}? (enter "save" to save) '->input()
        inputrestore()
        if choice == 'save' | execute $'mksession! {path}' | endif
    endif
enddef
autocmd VimLeave * if g:->get('working_on_restored_session', false) | SaveSess() | endif
# }}}

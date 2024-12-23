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

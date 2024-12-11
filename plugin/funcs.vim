vim9script

# Delete hidden buffers ---------------------------------------------------- {{{
def DeleteHiddenBuffers()
    var bufnrs = map(filter(getbufinfo(), (_, b) =>
        !b.changed && (!b.loaded || b.hidden)), (_, b) => b.bufnr)
    var closed = 0
    for nr in bufnrs
        silent execute $'bdelete {nr}'
        closed += 1
    endfor
    echom $'Closed {closed} buffers.'
enddef
command! DeleteHiddenBuffers call DeleteHiddenBuffers()
# }}}

# Show highlight group under cursor ---------------------------------------- {{{
def ShowHighlightGroup()
    var hi = synIDattr(synID(line("."), col("."), 1), "name")
    var trans = synIDattr(synID(line("."), col("."), 0), "name")
    var lo = synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
    echom $'hi<{hi}> --> trans<{trans}> --> lo<{lo}>'
enddef
command! ShowHighlightGroup ShowHighlightGroup()
# }}}


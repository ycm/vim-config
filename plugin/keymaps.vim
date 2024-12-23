vim9script

g:mapleader = ' '

# poplar (<leader>p...) ----------------------------------------------------- {{{
nnoremap <silent> <leader>p :Poplar<cr>
# }}}

# shimp (<leader>sh...) ---------------------------------------------------- {{{
nnoremap <silent> <leader>she :ShimpToggle<cr>
nnoremap <silent> <leader>shV :ShimpToggle left<cr>
nnoremap <silent> <leader>shv :ShimpToggle right<cr>
nnoremap <silent> <leader>shS :ShimpToggle top<cr>
nnoremap <silent> <leader>shs :ShimpToggle below<cr>
# }}}

# fzf (<leader>ff and <leader>rg) ------------------------------------------ {{{
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>rg :Rg<cr>
# }}}

# highlight ---------------------------------------------------------------- {{{
# highlight word under cursor
nnoremap * *``
# clear highlights
nnoremap <silent> <leader>/ :noh<cr>
# }}}

# line/paragraph mvmt (H,j,J,k,K,L) ---------------------------------------- {{{
nnoremap <silent> J :move +1<cr>==
nnoremap <silent> K :move -2<cr>==
vnoremap <silent> J :m '>+1<cr>gv=gv
vnoremap <silent> K :m '<-2<cr>gv=gv

# visual cursor movement
nnoremap <silent> <down> gj
nnoremap <silent> <up> gk
vnoremap <silent> <down> gj
vnoremap <silent> <up> gk
inoremap <expr> <down> pumvisible() ? "\<down>" : "\<C-o>gj"
inoremap <expr> <up>   pumvisible() ? "\<up>" : "\<C-o>gk"

# amplified hl
nnoremap H ^
nnoremap L $
# }}}

# split windows, resize splits, split mvmt --------------------------------- {{{
nnoremap <silent> ,= :vertical resize +5<cr>
nnoremap <silent> ,- :vertical resize -5<cr>
nnoremap <silent> ,[ :resize -3<cr>
nnoremap <silent> ,] :resize +3<cr>

# split terminals
export def SplitTerminalToRight()
    vertical terminal
    wincmd L
enddef
export def SplitTerminalBelow()
    terminal
    wincmd J
    wincmd N
    resize 10
enddef
command! SplitTerminalToRight SplitTerminalToRight()
command! SplitTerminalBelow SplitTerminalBelow()
nnoremap <silent> <leader>tl :SplitTerminalToRight<cr>
nnoremap <silent> <leader>tj :SplitTerminalBelow<cr>

# split window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

# allow window movement in terminal windows as well
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
# }}}

# open a scratch buffer (<leader>n...) ------------------------------------- {{{
export def OpenScratch(pos: string)
    echom pos
    var fname = $".scratch.{strftime('%Y-%m-%d-%H.%M.%S')}.txt"
    var sr = &splitright
    var sb = &splitbelow
    if pos ==? 'top'
        set nosplitbelow
        execute $':split {fname}'
    elseif pos ==? 'below'
        set splitbelow
        execute $':split {fname}'
    elseif pos ==? 'left'
        set nosplitright
        execute $':vsplit {fname}'
    elseif pos ==? 'right'
        set splitright
        execute $':vsplit {fname}'
    else
        execute $':edit {fname}'
    endif
    if sr
        set splitright
    else
        set nosplitright
    endif
    if sb
        set splitbelow
    else
        set nosplitbelow
    endif
enddef
command! -nargs=1 OpenScratch OpenScratch(<f-args>)
nnoremap <leader>ne :OpenScratch none<cr>
nnoremap <leader>nh :OpenScratch left<cr>
nnoremap <leader>nj :OpenScratch below<cr>
nnoremap <leader>nk :OpenScratch top<cr>
nnoremap <leader>nl :OpenScratch right<cr>
# }}}

# enclose selection in brackets (not for v-line and v-block) --------------- {{{
vnoremap <leader>( c()<Esc>Pl
vnoremap <leader>[ c[]<Esc>Pl
vnoremap <leader>{ c{}<Esc>Pl
vnoremap <leader>< c<><Esc>Pl
vnoremap <leader>' c''<Esc>Pl
vnoremap <leader>" c""<Esc>Pl
# }}}

# buffer navigation
nnoremap <leader>fb :ls<cr>:b<Space>

# switch to terminal normal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

# clang-format (format only, don't write)
nnoremap <silent> <leader>cf :let lpos = getpos('.')<cr>:%!clang-format<cr>:call setpos('.', lpos)<cr>

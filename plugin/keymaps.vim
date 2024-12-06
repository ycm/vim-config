let mapleader = " "

" harpy
nnoremap <silent> <leader>ll :Harpy<cr>
nnoremap <silent> <leader>la :HarpyAdd<cr>

" shimp
nnoremap <silent> <leader>sh :ShimpToggle<cr>

" overloads Esc to simulate Alt
let c='a'
while c <= 'z'
    exec "set <A-" . c . ">=\e" . c
    exec "imap \e". c ." <A-" . c . ">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" split resize
nnoremap ,= :vertical resize +5<cr>
nnoremap ,- :vertical resize -5<cr>
nnoremap ,[ :resize -3<cr>
nnoremap ,] :resize +3<cr>

" alternate file
nnoremap <leader><Tab> :e#<cr>

" file find
" nnoremap <leader>ff :e **/*
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>rg :Rg<cr>
" buffer navigation
nnoremap <leader>fb :ls<cr>:b<Space>

" switch to terminal normal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

fun! SplitTerminalToRight()
    vertical terminal
    wincmd L
endfun
fun! SplitTerminalBelow()
    terminal
    wincmd J
    wincmd N
    resize 10
endfun

" split terminals
nnoremap <leader>tl :call SplitTerminalToRight()<cr>
nnoremap <leader>tj :call SplitTerminalBelow()<cr>

" split window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" allow window movement in terminal windows as well
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" clang-format (format only, don't write)
nnoremap <leader>cf :let lpos = getpos('.')<cr>:%!clang-format<cr>:call setpos('.', lpos)<cr>

" line/paragraph movement
nnoremap <A-j> :move +1<cr>==
nnoremap <A-k> :move -2<cr>==
inoremap <A-j> <Esc>:m .+1<cr>==gi
inoremap <A-k> <Esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

" clear highlights
nnoremap <leader>/ :noh<cr>

let mapleader = " "

" overloads Esc to simulate Alt
let c='a'
while c <= 'z'
    exec "set <A-" . c . ">=\e" . c
    exec "imap \e". c ." <A-" . c . ">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" toggle NERDTree
nnoremap <leader>e :NERDTreeToggle<cr>

" split resize
nnoremap ,= :vertical resize +5<cr>
nnoremap ,- :vertical resize -5<cr>
nnoremap ,[ :resize -3<cr>
nnoremap ,] :resize +3<cr>

" file find
" nnoremap <leader>ff :e **/*
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>rg :Rg<CR>
" buffer navigation
nnoremap <leader>fb :ls<CR>:b<Space>
" ctrlP buffer
nnoremap <leader>b :CtrlPBuffer<CR>

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
nnoremap <leader>tl :call SplitTerminalToRight()<CR>
nnoremap <leader>tj :call SplitTerminalBelow()<CR>

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
nnoremap <leader>cf :let lpos = getpos('.')<CR>:%!clang-format<CR>:call setpos('.', lpos)<CR>

" line/paragraph movement
nnoremap <A-j> :move +1<CR>==
nnoremap <A-k> :move -2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" clear highlights
nnoremap <leader>/ :noh<CR>

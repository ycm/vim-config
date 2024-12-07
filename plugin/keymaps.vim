vim9script

# let mapleader = " "
g:mapleader = ' '


# harpy
nnoremap <silent> <leader>ll :Harpy<cr>
nnoremap <silent> <leader>la :HarpyAdd<cr>

# shimp
nnoremap <silent> <leader>sh :ShimpToggle<cr>

# amplified hjkl
nnoremap H ^
nnoremap J 5j
nnoremap K 5k
nnoremap L $

# highlight word under cursor
nnoremap * *``

# overloads Esc to simulate Alt
var ccc = 'a'
while ccc <= 'z'
    execute $"set <A-{ccc}>=\e{ccc}"
    execute $'imap \e{ccc} <A-{ccc}>'
    ccc = nr2char(1 + char2nr(ccc))
endwhile
set timeout ttimeoutlen=50

# line/paragraph movement
nnoremap <A-j> :move +1<cr>==
nnoremap <A-k> :move -2<cr>==
inoremap <A-j> <Esc>:m .+1<cr>==gi
inoremap <A-k> <Esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

# split resize
nnoremap ,= :vertical resize +5<cr>
nnoremap ,- :vertical resize -5<cr>
nnoremap ,[ :resize -3<cr>
nnoremap ,] :resize +3<cr>

# alternate file
nnoremap <leader><Tab> :e#<cr>

# file find
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>rg :Rg<cr>

# buffer navigation
nnoremap <leader>fb :ls<cr>:b<Space>

# switch to terminal normal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

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
command SplitTerminalToRight SplitTerminalToRight()
command SplitTerminalBelow SplitTerminalBelow()
nnoremap <leader>tl :SplitTerminalToRight<cr>
nnoremap <leader>tj :SplitTerminalBelow<cr>

# split window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

# allow window movement in terminal windows as well
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

# clang-format (format only, don't write)
nnoremap <leader>cf :let lpos = getpos('.')<cr>:%!clang-format<cr>:call setpos('.', lpos)<cr>

# clear highlights
nnoremap <leader>/ :noh<cr>

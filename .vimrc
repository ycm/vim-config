set number
set relativenumber

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

set backspace=indent,eol,start

set cursorline

syntax enable
set hlsearch
set incsearch " incremental search
set showmatch

set clipboard=unnamedplus

set wildmenu
set wildignore=*.o,*~,*.pyc,*/__pycache__/,.git/,.git/*,*.d,*.s,build/,build/*,*.png,*.bmp,*.gif,*json

set ignorecase " Make search case-insensitive
set smartcase " Make search case-sensitive if uppercase letter is used

set termguicolors

set wrap
set linebreak

set undolevels=1000 " Increase the undo history
" set undofile " Enable persistent undo

set statusline=%f\ %y\ %m\ %r\ %l/%L:%c

colorscheme ycm_minimal_colors

" https://nickjanetakis.com/blog/change-your-vim-cursor-from-a-block-to-line-in-normal-and-insert-mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 12

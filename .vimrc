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
set wildignore=*.o,*~,*.pyc,*/__pycache__/,.git/,.git/*,*.d,*.s,build/,build/*,*.png,*.bmp,*.gif,*json,plugged/,plugged/*

set ignorecase " Make search case-insensitive
set smartcase " Make search case-sensitive if uppercase letter is used

" set path+=** " Recursive find

set wrap
set linebreak

set undolevels=1000 " Increase the undo history
" set undofile " Enable persistent undo

" https://nickjanetakis.com/blog/change-your-vim-cursor-from-a-block-to-line-in-normal-and-insert-mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:netrw_banner = 0 " hide netrw banner

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dense-analysis/ale'
Plug 'markonm/traces.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
" Plug 'Eliot00/auto-pairs'
" Plug 'lifepillar/vim-devel' " for colortemplate
Plug 'lifepillar/vim-colortemplate/'
call plug#end()

set fillchars+=vert:\▕

set termguicolors
" set notermguicolors t_Co=16
set background=light
let g:enough_colors_opt_transp_bg=1
colo enough

set mouse=a
set noshowmode 
set noshowcmd  
set shortmess+=F 

set ssop=blank,buffers,curdir,folds,help,tabpages,winsize,terminal 

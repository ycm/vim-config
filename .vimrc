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

set termguicolors

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'markonm/traces.vim'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$'
  \ }

set termguicolors
colorscheme ycm_minimal_colors

set noshowmode 
set noshowcmd  
set shortmess+=F 

set ssop="blank,buffers,curdir,folds,help,tabpages,winsize,terminal" " remove options


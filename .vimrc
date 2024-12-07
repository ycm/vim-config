vim9script

# <TODO> fix NERDTree<>BufLeave interaction in go-away-and-come-back.vim

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
set incsearch
set showmatch

set clipboard=unnamedplus

set wildmenu
set wildignore=*.o,*~,*.pyc,*/__pycache__/,.git/,.git/*,*.d,*.s,build/,build/*,*.png,*.bmp,*.gif,*json,plugged/,plugged/*

set ignorecase
set smartcase

set wrap
set linebreak

set undolevels=1000
# set undofile # enable persistent undo

# https://nickjanetakis.com/blog/change-your-vim-cursor-from-a-block-to-line-in-normal-and-insert-mode
&t_SI = "\e[6 q"
&t_EI = "\e[2 q"

g:netrw_banner = 0 # hide netrw banner

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/nerdtree'
Plug 'markonm/traces.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-colortemplate/'
Plug 'Valloric/YouCompleteMe'
    g:ycm_show_diagnostics_ui = 0
Plug '~/garden/harpy'
Plug '~/garden/shimp'
call plug#end()

set completeopt+=popup # completions in popup instead of preview window

set fillchars+=vert:\▕

set termguicolors
# set notermguicolors t_Co=16
# set notermguicolors t_Co=8
if system("gsettings get org.gnome.desktop.interface color-scheme") =~ 'prefer-dark'
   set background=dark
else
   set background=light
endif

g:enough_colors_opt_transp_bg = 1
colo enough

set mouse=a
set noshowmode 
set noshowcmd  
set shortmess+=F 

set ssop=blank,buffers,curdir,folds,help,tabpages,winsize,terminal 

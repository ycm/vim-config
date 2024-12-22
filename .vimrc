vim9script

# <TODO> fix NERDTree<>BufLeave interaction in go-away-and-come-back.vim

set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt+=popup # completions in popup instead of preview window
set cursorline
set expandtab
set fillchars+=vert:\▕,eob:\ 
set foldmethod=syntax
set hlsearch
set ignorecase
set incsearch
set linebreak
set noshowmode 
set number
set relativenumber
set scrolloff=2
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal 
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set smoothscroll
set softtabstop=4
set splitright
set tabstop=4
set timeout ttimeoutlen=50
set undolevels=1000
set wildignore=*.o,*~,*.pyc,*/__pycache__/,.git/,.git/*,*.d,*.s,build/,build/*,*.png,*.bmp,*.gif,*json,plugged/,plugged/*
set wildmenu
set wrap

syntax enable

&t_SI = "\e[6 q"
&t_EI = "\e[2 q"
g:netrw_banner = 0 # hide netrw banner

# vim-plug ----------------------------------------------------------------- {{{
plug#begin('~/.vim/plugged')
# Plug 'preservim/nerdtree'
#     g:NERDTreeMapOpenVSplit = 'v'
#     g:NERDTreeStatusline = '%#Normal#'
Plug 'markonm/traces.vim' # range, pattern, and substitute preview
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-colortemplate/'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'LunarWatcher/auto-pairs'
Plug 'ubaldot/vim-highlight-yanked'
    g:hlyanked_hlgroup = 'Visual'
    g:hlyanked_timeout = 500 # [ms]
    g:hlyanked_save_yanks = true
Plug 'tpope/vim-eunuch'
Plug 'Valloric/YouCompleteMe'
    g:ycm_show_diagnostics_ui = 0
    g:ycm_key_list_select_completion = ['<Tab>']     # otherwise interfere with innoremap <up>/<down>
    g:ycm_key_list_previous_completion = ['<S-Tab>']
Plug 'kmonad/kmonad-vim'
Plug '~/garden/shimp'
# Plug 'ycm/poplar.vim'
Plug '~/garden/poplar.vim'
    g:poplar = {
        diropensymb: '▾',
        dirclosedsymb: '▸',
    }
plug#end()
# }}}

# colors ------------------------------------------------------------------- {{{
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
hi! link PoplarMenuSel CursorLine
hi! link PoplarMenu Normal
# }}}

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup cursorline_focus
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

vim9script

set backspace=indent,eol,start
set completeopt+=popup # completions in popup instead of preview window
set cursorline
set expandtab
set fillchars+=vert:\▕,eob:\ 
set foldmethod=syntax
set hlsearch
set ignorecase
set incsearch
set linebreak
set nocompatible
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

if !'g:os'->exists()
    g:os = has('win64') || has('win32') || has('win16') || has('win32unix')
            ? 'Windows'
            : 'uname'->system()->trim()
endif

if g:os =~? 'linux'
    set clipboard=unnamedplus
endif

&t_SI = "\e[6 q"
&t_EI = "\e[2 q"

# vim-plug ----------------------------------------------------------------- {{{
plug#begin('~/.vim/plugged')
if g:os =~? 'linux'
    Plug 'Valloric/YouCompleteMe'
    g:ycm_show_diagnostics_ui = 0
    g:ycm_key_list_select_completion = ['<Tab>']
    g:ycm_key_list_previous_completion = ['<S-Tab>']
    Plug '~/garden/shimp'
endif

if '~/garden/poplar.vim'->isdirectory()
    Plug '~/garden/poplar.vim'
else
    Plug 'ycm/poplar.vim'
endif
g:poplar = {
    diropensymb: '▾',
    dirclosedsymb: '▸',
}

if '~/garden/shimp'->isdirectory()
    Plug '~/garden/shimp'
else
    Plug 'ycm/shimp'
endif

Plug 'markonm/traces.vim' # range, pattern, and substitute preview
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
# Plug 'lifepillar/vim-colortemplate/'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'LunarWatcher/auto-pairs'
Plug 'ubaldot/vim-highlight-yanked'
    g:hlyanked_hlgroup = 'Visual'
    g:hlyanked_timeout = 500 # [ms]
    g:hlyanked_save_yanks = true
Plug 'tpope/vim-eunuch'
Plug 'kmonad/kmonad-vim'
plug#end()
# }}}

# colors ------------------------------------------------------------------- {{{
set termguicolors
set background=dark
   set background=light
   if g:os =~? 'linux' && 'gsettings get org.gnome.desktop.interface color-scheme'->system()->trim() =~ 'default'
endif
g:enough_colors_opt_transp_bg = 1
colorscheme enough
highlight! link PoplarMenuSel CursorLine
highlight! link PoplarMenu Normal
highlight! PoplarGitStaged guifg=#6eb46e
highlight! PoplarGitModified guifg=#b48c5a
highlight! PoplarGitRenamed guifg=#64b4a0
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

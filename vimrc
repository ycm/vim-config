vim9script

set backspace=indent,eol,start
set completeopt+=popup # completions in popup instead of preview window
set expandtab smartindent smarttab softtabstop=4 tabstop=4 shiftwidth=4
set fillchars+=vert:\▕,eob:\ 
set foldmethod=syntax
set hlsearch incsearch ignorecase smartcase
set nocompatible
set noshowmode 
set number relativenumber cursorline
set smoothscroll scrolloff=2 wrap linebreak
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal 
set showmatch
set splitbelow splitright
set timeout ttimeoutlen=50
set undolevels=1000
set wildmenu wildignore=*.o,*~,*.pyc,*/__pycache__/,.git/,.git/*,*.d,*.s,build/,build/*,*.png,*.bmp,*.gif,*json,plugged/,plugged/*

filetype plugin on
syntax enable

if !'g:os'->exists()
    g:os = has('win64') || has('win32') || has('win16') || has('win32unix')
            ? 'Windows'
            : 'uname'->system()->trim()
endif

g:hostname = 'hostname'->system()->trim()
if g:hostname == 'lavender' | set clipboard=unnamedplus | endif

# cursor
&t_SI = "\e[6 q"
&t_EI = "\e[2 q"

# disable netrw
g:loaded_netrw = 1

# vim-plug ----------------------------------------------------------------- {{{
plug#begin('~/.vim/plugged')
if g:hostname == 'lavender'
    Plug 'Valloric/YouCompleteMe'
    g:ycm_show_diagnostics_ui = 0
    g:ycm_key_list_select_completion = ['<Tab>']
    g:ycm_key_list_previous_completion = ['<S-Tab>']
    Plug 'lifepillar/vim-colortemplate/'
endif

if '/home/ycm/garden/poplar.vim'->isdirectory()
    Plug '/home/ycm/garden/poplar.vim'
else
    Plug 'ycm/poplar.vim'
endif
g:poplar = {
    diropensymb: '▾',
    dirclosedsymb: '▸',
}

if '/home/ycm/garden/shimp'->isdirectory()
    Plug '/home/ycm/garden/shimp'
else
    Plug 'ycm/shimp'
endif

Plug 'markonm/traces.vim' # range, pattern, and substitute preview
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'LunarWatcher/auto-pairs'
Plug 'ubaldot/vim-highlight-yanked'
    g:hlyanked_hlgroup = 'Visual'
    g:hlyanked_timeout = 500 # [ms]
    g:hlyanked_save_yanks = true
Plug 'tpope/vim-eunuch'
Plug 'vimwiki/vimwiki'
Plug 'ycm/enough-colors'

# filetype-specific
Plug 'kmonad/kmonad-vim'
Plug 'JuliaEditorSupport/julia-vim'

plug#end()
# }}}

# colors ------------------------------------------------------------------- {{{
set termguicolors
set background=dark
if g:hostname == 'lavender' && 'gsettings get org.gnome.desktop.interface color-scheme'->system()->trim() =~ 'default'
   set background=light
endif
g:enough_colors_opt_transp_bg = 1
colorscheme enough
highlight! link PoplarMenuSel CursorLine
highlight! link PoplarMenu Normal
if &background == 'light'
    highlight! PoplarGitStaged ctermfg=darkgreen
    highlight! PoplarGitModified ctermfg=darkyellow
    highlight! PoplarGitRenamed ctermfg=darkmagenta
else
    highlight! PoplarGitStaged ctermfg=lightgreen guifg=#6eb46e
    highlight! PoplarGitModified ctermfg=lightyellow guifg=#b48c5a
    highlight! PoplarGitRenamed ctermfg=lightmagenta guifg=#b46eb4
endif
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

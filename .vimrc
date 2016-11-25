set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'rdnetto/YCM-Generator.git'
Plugin 'lyuts/vim-rtags'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linesyntax on

" General settings
" -----------------------------------------------------------------------
" set syntax highlighting
syntax on                   
" show line numbers
set number
" shifting size using << and >>
set shiftwidth=4
" tab size
set tabstop=4
set smarttab
" replace tabs with spaces
set expandtab
set splitright
set splitbelow
set relativenumber

set diffopt+=vertical
" -----------------------------------------------------------------------

" replace current with next line
map - ddp
" replace current with previous line
map _ ddP
" use space as mapleader
let mapleader = " "

" Moving through tabs
map <Leader>t <esc>:tabedit<CR>
map <Leader>T <esc>:tabclose<CR>
map <Leader>i <esc>:tabprevious<CR>
map <Leader>o <esc>:tabnext<CR>

" Better indent
vnoremap < <gv
vnoremap > >gv

" Remap function keys
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if has("win32")
    nmap <F11> <esc>:!start explorer /select,%:p<CR>
endif
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Update rtags
nmap <F5> <esc>:!rc -J .<CR>

" YCM
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
" YCM key bindings
map <Leader>cj <esc>:YcmCompleter GoTo<CR>
map <Leader>cJ <esc>:YcmCompleter GoToDeclaration<CR>
map <Leader>cf <esc>:YcmCompleter GoToReferences<CR>
map <Leader>cd <esc>:YcmDiags<CR>
map <Leader>ce <esc>:YcmDebugInfo<CR>
map <Leader>cl <esc>:YcmToggleLogs<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Debug
au FileType python map <silent> <Leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <Leader>B Oimport ipdb; ipdb.set_trace()<esc>

" Line markings
:hi ColorColumn ctermbg=lightgrey guibg=lightgrey
au FileType python set colorcolumn=79
au FileType c set colorcolumn=90

" Folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" wscript
au BufNewFile,BufRead wscript set filetype=python

" Gvim
if has("win32")
    set guifont=Consolas:h11:cANSI
    au GUIEnter * simalt ~x
endif

nnoremap <space> <NOP>

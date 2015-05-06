" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/etc/vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim.git'
Plugin 'tpope/vim-surround.git'
Plugin 'msanders/snipmate.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'corntrace/bufexplorer.git'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'tmhedberg/matchit.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'sjl/gundo.vim.git'

call vundle#end()
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader h,l to first and last non-blank character
map <leader>h ^
map <leader>l $

" Set comma as leader
let mapleader=","

" jk is escape
inoremap jk <esc>

" Toggle hlsearch 
noremap <leader><space> :nohlsearch<CR>

" comma-w navigates windows
map <leader>w <C-w>

" set leader-j and leader-l to beginning and end of line
nnoremap <leader>h <Home>
nnoremap <leader>l <End>

" set leader-g to Gundo
nnoremap <leader>g :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""
" => CtrlP options
"""""""""""""""""""""""""""""""""""""

" Ctrl-P buffer
noremap <leader>p :CtrlPBuffer<CR>

" Disable Ctrl-P from using current working diretcory for search
let g:ctrlp_working_path_mode = 0

" Use ag with CtrlP
let g:ctrlp_user_command = 'ag %s -l -g ""'

"""""""""""""""""""""""""""""""""""""
" => Search options
""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

let g:solarized_termtrans=1

set background=dark

colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Display line numbers
set relativenumber 
set number

" Break lines at 78 chars
set tw=78

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
"
" Format the status line
set statusline=%f\  " Path to the file
set statusline+=%{fugitive#statusline()} " Git branch
set statusline+=%= " Switch to the right side
set statusline+=Col:\ 
set statusline+=%c " Current column number
set statusline+=\ \ Line:\ 
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines"
"
""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree options
""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <leader>n :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap files
""""""""""""""""""""""""""""""
set swapfile
set dir=/tmp

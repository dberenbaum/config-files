set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
call plug#begin('~/vim/plugged')

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-repeat'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'

call plug#end()

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

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

"""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set comma as leader
let mapleader=","

" jk is escape
inoremap jk <esc>

" Toggle hlsearch 
noremap <leader><space> :nohlsearch<CR>

" set path
set path+=**

" set leader-h and leader-l to beginning and end of line
nnoremap <leader>h <Home>
nnoremap <leader>l <End>

" set leader-g to Gundo
nnoremap <leader>g :GundoToggle<CR>

nnoremap <space> :

" windows
nnoremap <leader>w <C-w>

" copy and paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" toggle paste mode
nnoremap <leader>p :set invpaste<CR>

"""""""""""""""""""""""""""""""""""""
" => Search options
""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu
set wildmode=list:full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

"let g:solarized_termtrans=1

"set background=dark

"colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Display line numbers
set relativenumber 
set number

" Break lines
set tw=100

" location list
nnoremap <leader>o :lopen<CR>
nnoremap <leader>c :lclose<CR>

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

set backspace=indent,eol,start

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
set statusline+=%= " Switch to the right side
set statusline+=Col:\ 
set statusline+=%c " Current column number
set statusline+=\ \ Line:\ 
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines"
set statusline+=/ " Separator

"
""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree options
""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <leader>n :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap files
""""""""""""""""""""""""""""""
set swapfile
set dir=/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['pylint', 'pycodestyle'],
\}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Help
""""""""""""""""""""""""""""""
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>

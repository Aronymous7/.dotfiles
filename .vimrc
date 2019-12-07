" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'lervag/vimtex'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = "ä"
let maplocalleader = "ü"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=90
set formatoptions=tcqn1
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
map <leader><space> :noh<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark


" My own stuff :)

set autoindent
set splitbelow splitright

" Map Escape (enter normal mode)
inoremap jj <ESC>

" Ask for confirmation when :q and not saved
set confirm

" Create and jump to tags
inoremap öö <++>
inoremap ö<space> <ESC>/<++><CR>"_c4l

" Auto close brackets
inoremap " ""<++><ESC>4hi
inoremap ' ''<++><ESC>4hi
inoremap ( ()<++><ESC>4hi
inoremap [ []<++><ESC>4hi
inoremap { {}<++><ESC>4hi
inoremap {<CR> {<CR>}<++><ESC>O
inoremap {;<CR> {<CR>};<++><ESC>O

" Better command line completion
set wildmenu
set wildmode=longest,list,full

" Latex bindings
autocmd FileType tex nnoremap öb a\{<++>}<++><ESC>F{i
autocmd FileType tex inoremap ö<CR> \\<CR>

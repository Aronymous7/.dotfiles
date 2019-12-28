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

" Set default pdf-viewer for vimtex
let g:vimtex_view_general_viewer='okular'

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
set textwidth=0
set linebreak
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
set background=dark


set autoindent
set splitbelow splitright

" Better command line completion
set wildmenu
set wildmode=longest,list,full

" Ask for confirmation when :q and not saved
set confirm

" Use system clipboard by default
set clipboard=unnamedplus

" Map Escape (enter normal mode)
inoremap jj <ESC>

" Save file
nnoremap <C-s> :update<cr>
inoremap <C-s> <Esc>:update<cr>gi

" Activate spell checking
nnoremap <leader>s :setlocal spell spelllang=de<CR>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Surrounding
vnoremap ö( "sc()<ESC>"sP

" Create and jump to tags
inoremap öö <++>
inoremap ö<space> <ESC>/<++><CR>:noh<CR>"_c4l

" Auto close brackets
inoremap " ""<++><ESC>4hi
inoremap ( ()<++><ESC>4hi
inoremap [ []<++><ESC>4hi
inoremap { {}<++><ESC>4hi
inoremap {<CR> {<CR>}<++><ESC>O
inoremap {;<CR> {<CR>};<++><ESC>O

" Latex bindings
autocmd FileType tex inoremap $ $$<++><ESC>4hi
autocmd FileType tex inoremap öö<CR> \\<CR>
autocmd FileType tex inoremap ööe <ESC>0"zdwA\begin{<ESC>"zpa}<CR><CR>\end{<ESC>"zpa}<up>
autocmd FileType tex inoremap öös \section{}<++><ESC>T{i
autocmd FileType tex inoremap ööf \begin{frame}{\secname}<CR><CR>\end{frame}<up>
autocmd FileType tex inoremap ööb \textbf{}<++><ESC>T{i
autocmd FileType tex inoremap ööi \textit{}<++><ESC>T{i

" Java bindings
autocmd FileType java inoremap ö; <ESC>A;
autocmd FileType java inoremap öi if<space>(<right><space>{<CR><++><up><ESC>F)i
autocmd FileType java nnoremap öee A<space>else<space>{<CR>
autocmd FileType java nnoremap öei A<space>else<space>if<space>(<right><space>{<CR><++><up><ESC>f)i
autocmd FileType java inoremap öw while<space>(<right><space>{<CR><++><up><ESC>F)i
autocmd FileType java inoremap öf for<space>(;<++>;<++><right><space>{<CR><++><up><ESC>T(i
autocmd FileType java inoremap öm (<++><right><space>{<CR><++><up><ESC>F(i

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
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

" Wrapping and tabbing
set wrap
set textwidth=0
set linebreak
set formatoptions=tcqn1
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noshiftround

" Cursor motion
set scrolloff=4
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

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Color scheme (terminal)
set background=dark

" GVim settings
if has("gui_running")
	colorscheme industry
	set guifont=Iosevka\ 12
	set guicursor=n-v-c-i:block-Cursor
	set guicursor+=n-v-c-i:blinkon0
endif


set autoindent
set splitbelow splitright

" Beam-cursor in insert mode
let &t_EI .= "\<Esc>[2 q"
let &t_SR .= "\<Esc>[2 q"
let &t_SI .= "\<Esc>[6 q"

" Better command line completion
set wildmenu
set wildmode=longest,list,full

" Ask for confirmation when :q and not saved
set confirm

" Use system clipboard by default
set clipboard=unnamedplus

" Visual line movement
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap g$ $

" Map Escape (enter normal mode)
inoremap jj <ESC>

" Save file
nnoremap <C-s> :update<cr>
inoremap <C-s> <Esc>:update<cr>gi

" Spell checking
nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sd :setlocal spell! spelllang=de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en<CR>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Surrounding
vnoremap ö( "sc()<ESC>"sP

" Jump to tags
inoremap ö<space> <ESC>/<++><CR>:noh<CR>"_c4l

" Auto close brackets
inoremap " ""<++><ESC>4hi
inoremap ( ()<++><ESC>4hi
inoremap [ []<++><ESC>4hi
inoremap { {}<++><ESC>4hi

" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" Latex bindings
autocmd FileType tex inoremap $ $$<++><ESC>4hi
autocmd FileType tex inoremap öö<CR> \\<CR>
autocmd FileType tex inoremap ööe <ESC>0"zdwA\begin{<ESC>"zpa}<CR><CR>\end{<ESC>"zpa}<up>
autocmd FileType tex inoremap öös \section{}<++><ESC>T{i
autocmd FileType tex inoremap ööf \begin{frame}{}<CR><++><CR>\end{frame}<ESC>2kf{a
autocmd FileType tex inoremap ööb \textbf{}<++><ESC>T{i
autocmd FileType tex inoremap ööi \textit{}<++><ESC>T{i
autocmd FileType tex inoremap ööc \cite{}<++><ESC>T{i
autocmd FileType tex inoremap ööll \begin{itemize}<CR><CR>\end{itemize}<up>\item<space>
autocmd FileType tex inoremap ööle \begin{enumerate}<CR><CR>\end{enumerate}<up>\item<space>
autocmd FileType tex inoremap ööli \item<space>
autocmd FileType tex inoremap öörl \label{}<++><ESC>T{i
autocmd FileType tex inoremap öörr \ref{}<++><ESC>T{i

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Vimtex options
let g:vimtex_view_general_viewer='okular'

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic linters
let g:syntastic_ruby_checkers = ['rubocop']

" Supertab options
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1

" Pick a leader key
let mapleader = "ä"
let maplocalleader = "ü"

" Security
set modelines=0

" Line numbers and status bar
set number
set ruler
set laststatus=2
set showmode
set showcmd

" Encoding
set encoding=utf-8

" Wrapping and tabbing
set wrap
set textwidth=0
set linebreak
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" Show as many lines as possible
set display+=truncate

" Formatting
set formatoptions=tcqn1j
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set nrformats-=octal

" Cursor motion
set scrolloff=4
set backspace=indent,eol,start
runtime! macros/matchit.vim

" Highlighting
hi MatchParen cterm=bold ctermbg=darkgray ctermfg=none
hi CursorLine cterm=none ctermbg=darkgray ctermfg=none
nnoremap <Leader>c :set cursorline!<CR>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Searching
set incsearch
set ignorecase
nnoremap <leader>h :set hlsearch!<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬,space:•
nnoremap <leader>l :set list!<CR> " Toggle tabs and EOL

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>w :%s/\s\+$//e<CR>

" Jump to last position when opening file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Color scheme (terminal)
set background=dark

" GVim settings
if has("gui_running")
	colorscheme industry
	set guifont=Inconsolata\ 12
	set guicursor=n-v-c-i:block-Cursor
	set guicursor+=n-v-c-i:blinkon0
endif


" More intuitive splitting
set splitbelow splitright

" Always read external changes
set autoread

" Timeout on keycodes
set ttimeout
set ttimeoutlen=100

" Enable mouse
set ttymouse=xterm2
set mouse=a

" General completion settings
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<space>\<backspace>" : "\<CR>"
set wildmenu
set wildmode=list:longest,full

" Beam-cursor in insert mode
let &t_EI .= "\<Esc>[2 q"
let &t_SR .= "\<Esc>[2 q"
let &t_SI .= "\<Esc>[6 q"

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
vnoremap <space> <ESC>

" Save file
nnoremap <C-s> :update<cr>
inoremap <C-s> <Esc>:update<CR>gi

" Spell checking
nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sd :setlocal spell! spelllang=de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en<CR>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Surrounding
vnoremap ö( "sc()<ESC>"sP<right>
vnoremap ö[ "sc[]<ESC>"sP<right>
vnoremap ö{ "sc{}<ESC>"sP<right>
vnoremap ö" "sc""<ESC>"sP<right>
vnoremap ö' "sc''<ESC>"sP<right>

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
autocmd FileType tex inoremap öög \includegraphics[width=0.5\textwidth]{}<++><ESC>T{i

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Auto-Pairs options
let g:AutoPairsShortcutJump = 'ö<space>'
let g:AutoPairsShortcutFastWrap = 'ä<space>'

" Vimtex options
let g:vimtex_view_general_viewer='okular'

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Supertab options
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1

" General completion settings
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<space>\<backspace>" : "\<CR>"
set wildmenu
set wildmode=list:longest,full

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

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Searching
set ignorecase
nnoremap <leader>h :set hlsearch!<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬,space:•
nnoremap <leader>l :set list!<CR> " Toggle tabs and EOL

" Jump to last position when opening file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Highlighting
hi PmenuSel cterm=bold ctermbg=darkgray ctermfg=none
hi MatchParen cterm=bold ctermbg=darkgray ctermfg=none
hi CursorLine cterm=none ctermbg=darkgray ctermfg=none
nnoremap <Leader>c :set cursorline!<CR>
set cursorline

" Color scheme (terminal)
set t_Co=256
let g:jellybeans_overrides = { 'background': { 'guibg': '000000' } }
colorscheme jellybeans
set background=dark

" GVim settings
if has("gui_running")
	colorscheme jellybeans
	set guifont=Inconsolata\ 12
	set guicursor=n-v-c-i:block-Cursor
	set guicursor+=n-v-c-i:blinkon0
endif

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>w :%s/\s\+$//e<CR>

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
nnoremap <leader>sg :setlocal spell! spelllang=de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en<CR>

" Subsitution bindings
nnoremap <leader>rr :%s//gI<left><left><left>
nnoremap <leader>rg :bufdo %s//geI<left><left><left><left>
vnoremap <leader>r :s//gI<left><left><left>

" Fugitive bindings
nnoremap <leader>gg :G<CR>
nnoremap <leader>gp :Gpush<CR>

" NERDTree bindings
nnoremap <leader>t :NERDTreeToggle<CR>

" Syntastic bindings
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<space>

" Insert mode mappings
inoremap Ö<space> <right>
inoremap ö<CR> <ESC>o
inoremap Ö<CR> <ESC>O

" (e)Ruby bindings
autocmd FileType ruby,eruby let b:AutoPairs = AutoPairsDefine({'|':'|'})
autocmd FileType eruby let b:AutoPairs = AutoPairsDefine({'<%':'%>//n', '<%=':'%>//n', '<p>':'</p>//n', '<h1>':'</h1>//n', '<h2>':'</h2>//n', '<h3>':'</h3>//n', '<table>':'</table>//n', '<tr>':'</tr>//n', '<td>':'</td>//n', '<th>':'</th>//n'})

" HTML bindings
autocmd FileType html let b:AutoPairs = AutoPairsDefine({'<p>':'</p>//n'})

" Latex bindings
autocmd FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'})
autocmd FileType tex inoremap ööe <ESC>0"zdwA\begin{<ESC>"zpa}<CR><CR>\end{<ESC>"zpa}<up>
autocmd FileType tex inoremap öös \section{}<left>
autocmd FileType tex inoremap ööf \begin{frame}{}<CR>\end{frame}<ESC>kf{a
autocmd FileType tex inoremap ööb \textbf{}<left>
autocmd FileType tex inoremap ööi \textit{}<left>
autocmd FileType tex inoremap ööc \cite{}<left>
autocmd FileType tex inoremap ööll \begin{itemize}<CR><CR>\end{itemize}<up>\item<space>
autocmd FileType tex inoremap ööle \begin{enumerate}<CR><CR>\end{enumerate}<up>\item<space>
autocmd FileType tex inoremap ööli \item<space>
autocmd FileType tex inoremap öörl \label{}<left>
autocmd FileType tex inoremap öörr \ref{}<left>
autocmd FileType tex inoremap öög \includegraphics[width=0.8\textwidth]{}<left>

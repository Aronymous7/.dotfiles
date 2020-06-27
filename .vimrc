" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'adelarsq/vim-matchit'
Plug 'nanotech/jellybeans.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'honza/vim-snippets'
Plug 'sirver/UltiSnips'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" AutoPairs options
let g:AutoPairsMultilineClose = 0
let g:AutoPairsCenterLine = 0
let g:AutoPairsMapCh = 0

" Vimtex options
let g:vimtex_view_method = 'zathura'
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
autocmd VimEnter * let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips options
let g:UltiSnipsExpandTrigger = '<leader><leader>'
let g:UltiSnipsListSnippets = '<leader>:'
let g:UltiSnipsJumpForwardTrigger = ';<Tab>'
let g:UltiSnipsJumpBackwardTrigger = ':<Tab>'

" Pick a leader key
let mapleader = ";"
let maplocalleader = "\\"

" Security
set modelines=0

" Path for find
set path^=**/

" Line numbers and status bar
set number
set showcmd
set noshowmode

" Encoding
set encoding=utf-8

" Wrapping and tabbing
set wrap
set linebreak
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent

" Show as many lines as possible
set display+=truncate

" Formatting
set formatoptions=tcqn1j
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set nrformats-=octal

" Cursor motion and cursorline
set scrolloff=4
set backspace=indent,eol,start
set cursorline

" Allow hidden buffers and ask for confirmation when :q and not saved
set hidden
set confirm

" Rendering
set ttyfast

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

" Folding
set foldmethod=syntax
set nofoldenable

" Store undo buffers in files
set undofile
set undodir=~/.config/vimundo

" Spell checking in english and german
set spelllang=en,de

" Column at 100 characters and gutter
set colorcolumn=101

" Wildmenu for command completion
set wildmenu
set wildmode=list:longest,full

" Case insensitivity for searching, autocompletion etc.
set ignorecase
set incsearch

" Visualize tabs, newlines and spaces
set listchars=tab:▸\ ,eol:¬,space:•

" Jump to last position when opening file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Color scheme (terminal)
set t_Co=256
let g:jellybeans_overrides = { 'background': { 'guibg': '000000' } }
colorscheme jellybeans
set background=dark

" GVim settings
if has("gui_running")
	set guifont=Inconsolata\ 12
	set guicursor=n-v-c-i:block-Cursor
	set guicursor+=n-v-c-i:blinkon0
endif

" Vertical line for character limit
hi ColorColumn ctermbg=darkgray guibg=darkgray

" Highlight trailing whitespaces
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>wc :call<space>clearmatches()<CR>
nnoremap <leader>wd :%s/\s\+$//e<CR>

" Beam-cursor in insert mode
let &t_EI .= "\<Esc>[2 q"
let &t_SR .= "\<Esc>[2 q"
let &t_SI .= "\<Esc>[6 q"

" Unbind enter Ex-mode
nnoremap Q <nop>

" Copy/paste to/from system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <C-c> "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
vnoremap <C-v> "+p
inoremap <C-v> <ESC>"+pa

" Map Escape
inoremap jj <ESC>
vnoremap <space> <ESC>
snoremap <space> <ESC>

" Save and find file
nnoremap <C-s> :update<cr>
nnoremap <C-p> :find<space>

" Move right in insert mode
inoremap <C-l> <right>

" Delete buffer
nnoremap - :bd<space>

" Substitution bindings
nnoremap <leader>rr yiw:%s/<C-r>"//gI<left><left><left>
nnoremap <leader>rg yiw:bufdo<space>%s/<C-r>"//geI<left><left><left><left>
vnoremap <leader>r :s//gI<left><left><left>

" NERDTree bindings
nnoremap <leader>t :NERDTreeToggle<CR>

" Syntastic bindings
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<space>

" Compile markdown files
autocmd FileType markdown nnoremap <leader>c :!pandoc<space>%<space>-o<space>%<.html<CR>

" Remove vertical line-limit-column for some filetypes
autocmd FileType tex,markdown,rmd,text setlocal colorcolumn = ""

" Add some AutoPairs for different filetypes
augroup auto_pairs
	autocmd FileType ruby let b:AutoPairs = AutoPairsDefine({'|':'|'})
	autocmd FileType eruby let b:AutoPairs = AutoPairsDefine({'|':'|', '<%':'%>//n', '<%=':'%>//n'})
	autocmd FileType tex,markdown let b:AutoPairs = AutoPairsDefine({'$' : '$'})
	autocmd FileType html,xml let b:AutoPairs = AutoPairsDefine({'<' : '>'})
augroup END

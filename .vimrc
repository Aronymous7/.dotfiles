" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'adelarsq/vim-matchit'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'sirver/UltiSnips'
Plug 'ycm-core/YouCompleteMe'
Plug 'gko/vim-coloresque'
Plug 'prettier/vim-prettier', {
	\ 'do': 'npm install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
			\ 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" CtrlP options
let g:ctrlp_map = '<leader>f'

" Auto-Pairs options
let g:AutoPairsShortcutJump = 'ö<space>'

" Vimtex options
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_imaps_leader = 'ä'
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
autocmd VimEnter * let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "passive_filetypes": ["tex"] }

" Emmet options
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
autocmd FileType html,xml,css,scss EmmetInstall

" UltiSnips options
let g:UltiSnipsExpandTrigger = 'öö'
let g:UltiSnipsListSnippets = 'ÖÖ'
let g:UltiSnipsJumpForwardTrigger = 'ö<Tab>'
let g:UltiSnipsJumpBackwardTrigger = 'Ö<Tab>'

" YCM options
let g:ycm_collect_identifiers_from_tags_files = 1

" Pick a leader key
let mapleader = "ö"
let maplocalleader = "ü"

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
set colorcolumn=81
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" Show as many lines as possible
set display+=truncate

" Formatting
set formatoptions=tcqn1j
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set nrformats-=octal

" Cursor motion
set scrolloff=4
set backspace=indent,eol,start

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Wildmenu for command completion
set wildmenu
set wildmode=list:longest,full

" Searching
set ignorecase
set smartcase
nnoremap <leader>h :set hlsearch!<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬,space:•
nnoremap <leader>l :set list!<CR>

" Jump to last position when opening file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Highlighting ()
"hi PmenuSel cterm=bold ctermbg=darkgray ctermfg=none
"hi MatchParen cterm=bold ctermbg=darkgray ctermfg=none
"hi CursorLine cterm=none ctermbg=darkgray ctermfg=none
set cursorline

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

" Highlighting after setting color scheme
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

" Beam-cursor in insert mode
let &t_EI .= "\<Esc>[2 q"
let &t_SR .= "\<Esc>[2 q"
let &t_SI .= "\<Esc>[6 q"

" Ask for confirmation when :q and not saved
set confirm

" Copy/paste to/from system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Visual line movement
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap g$ $

" Map Escape
inoremap jj <ESC>
vnoremap <space> <ESC>
snoremap <space> <ESC>

" Save file
nnoremap <C-s> :update<cr>
inoremap <C-s> <Esc>:update<CR>gi

" Spell checking
nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sg :setlocal spell! spelllang=de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en<CR>

" Substitution bindings
nnoremap <leader>rr yiw:%s/<C-r>"//gI<left><left><left>
nnoremap <leader>rg yiw:bufdo<space>%s/<C-r>"//geI<left><left><left><left>
vnoremap <leader>r :s//gI<left><left><left>

" Switch windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffers
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap - :bd<space>

" Move right in insert mode
inoremap Ö<space> <right>

" NERDTree bindings
nnoremap <leader>t :NERDTreeToggle<CR>

" Syntastic bindings
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<space>

" (e)Ruby settings
autocmd FileType ruby,eruby let b:AutoPairs = AutoPairsDefine({'|':'|'})
autocmd FileType eruby let b:AutoPairs = AutoPairsDefine({'<%':'%>//n', '<%=':'%>//n'})

" Latex settings
autocmd FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$'})
autocmd FileType tex set colorcolumn = ""

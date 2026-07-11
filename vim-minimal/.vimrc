" Minimal Vim config for remote servers
" No plugins needed — uses only built-in features
" Usage: scp ~/.config/nvim/vim-minimal/.vimrc user@server:~/.vimrc

let mapleader = " "

" ── General ──────────────────────────────────────────────
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
set fileencoding=utf-8

" ── UI ───────────────────────────────────────────────────
set number
set relativenumber
set cursorline
set signcolumn=yes
set termguicolors
set laststatus=2
set showmode
set ruler
set wildmenu
set wildmode=longest:full,full
set showcmd
set fillchars=eob:\ 

" ── Search ───────────────────────────────────────────────
set ignorecase
set smartcase
set hlsearch
set incsearch

" ── Indentation ──────────────────────────────────────────
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent

" ── Behavior ─────────────────────────────────────────────
set mouse=a
set clipboard=unnamedplus
set wrap!
set updatetime=300
set timeoutlen=500
set hidden
set scrolloff=8
set backspace=indent,eol,start

" ── Files ────────────────────────────────────────────────
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir

" ── Statusline ───────────────────────────────────────────
set statusline=
set statusline+=\ %n\ 
set statusline+=%f\ 
set statusline+=%m%r
set statusline+=%=
set statusline+=%{&filetype}\ 
set statusline+=%{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=%l:%c\ 
set statusline+=%p%%\ 

" ── Diagnostics (manual, no plugin) ──────────────────────
" Show errors/warnings in statusline
set statusline+=%#WarningMsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ── Keymaps ──────────────────────────────────────────────
" Window navigation
nnoremap <M-H> <C-w>h
nnoremap <M-J> <C-w>j
nnoremap <M-K> <C-w>k
nnoremap <M-L> <C-w>l

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Clear search highlight
nnoremap <Esc> :nohlsearch<CR>

" File explorer (built-in netrw)
nnoremap <leader>e :Lexplore<CR>

" Quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" ── Netrw (built-in file explorer) ──────────────────────
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" ── Create undo dir if missing ───────────────────────────
if !isdirectory($HOME . "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif

" ── Auto-resize splits on window resize ──────────────────
autocmd VimResized * wincmd =

" ── Highlight trailing whitespace ────────────────────────
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" ── Restore cursor position ──────────────────────────────
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

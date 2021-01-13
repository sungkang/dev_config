call plug#begin()
" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'

Plug 'airblade/vim-gitgutter'
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'evanleck/vim-svelte'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'godlygeek/tabular'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-exchange'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'reedes/vim-pencil'
Plug 'mg979/vim-visual-multi'
call plug#end()

" color scheme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

syntax on

filetype plugin indent on

" general settings
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set hlsearch
set incsearch
set nostartofline
set number
set relativenumber
set cursorline
set ruler
set shiftwidth=4
set showcmd
set softtabstop=4
set timeoutlen=400
set ttimeoutlen=10

" mappings
let mapleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>/ :noh<cr>
noremap <silent> <leader>q :q<cr>
noremap <silent> <leader>Q :q!<cr>
noremap <silent> <leader>w :w<cr>

" mappings: navigation
nnoremap L Lzz
nnoremap H Hzz

" mappings: window management
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

noremap <leader>hh <c-w>H
noremap <leader>jj <c-w>J
noremap <leader>kk <c-w>K
noremap <leader>ll <c-w>L

" mappings: formatters
noremap <silent> <leader>jf :'<,'>!python -m json.tool<CR>
nnoremap <silent> <leader>xf :%!xmllint --format -<cr>

" mappings: diff
noremap <silent> <leader>dfa :windo diffthis<CR>
noremap <silent> <leader>dfo :windo diffoff<CR>

" fzf
map <c-p> :GFiles<CR>
map <c-f> :Files<CR>
map <c-b> :BTags<CR>

" macros
runtime macros/matchit.vim

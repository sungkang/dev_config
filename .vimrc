call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'airblade/vim-gitgutter'
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'evanleck/vim-svelte'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'godlygeek/tabular'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-exchange'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mg979/vim-visual-multi'
call plug#end()

" color scheme and fonts
if (has("gui_vimr") == 0)
    set guifont=JetBrainsMono-Regular:h13
endif

if (has("termguicolors"))
    set termguicolors
endif

"colorscheme nord
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

syntax on

filetype plugin indent on

" general settings
set autoindent
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set nocompatible
set nostartofline
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=4
set timeoutlen=400
set ttimeoutlen=10
set ttyfast

" mappings
let mapleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <silent> <leader>n :NERDTreeToggle<cr>
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

" mappings: date
" TODO: not there yet, I want it to paste at the current cursor
noremap <silent> <leader>td :put! =strftime('%a %B %d, %Y')<cr>

" fzf
noremap <c-p> :GFiles<CR>
noremap <leader>gg :GFiles?<CR>
noremap <c-f> :Files<CR>
noremap <c-b> :BTags<CR>

" macros
runtime macros/matchit.vim

" runtimes
autocmd FileType lua nnoremap <buffer> <f9> :w<cr>:exec '!lua' shellescape(@%, 1)<cr>
autocmd FileType lua inoremap <buffer> <f9> <esc><esc>:w<cr>:exec '!lua' shellescape(@%, 1)<cr>
:map! <f9> <nop>

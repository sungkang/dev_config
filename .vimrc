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
Plug 'reedes/vim-pencil'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/goyo.vim'
call plug#end()

" color scheme
set nocompatible
if(has("termguicolors"))
    set termguicolors
endif

colorscheme nord
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
"set background=dark

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

" Call lazygit in a window
        function! Flt_term_win(cmd, width, height, border_highlight) abort
            let width = float2nr(&columns * a:width)
            let height = float2nr(&lines * a:height)
            let bufnr = term_start(a:cmd, {'hidden': 1, 'term_finish': 'close'})

            let winid = popup_create(bufnr, {
                    \ 'minwidth': width,
                    \ 'maxwidth': width,
                    \ 'minheight': height,
                    \ 'maxheight': height,
                    \ 'border': [],
                    \ 'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
                    \ 'borderhighlight': [a:border_highlight],
                    \ 'padding': [0,1,0,1],
                    \ 'highlight': a:border_highlight
                    \ })

            " Optionally set the 'Normal' color for the terminal buffer
            " call setwinvar(winid, '&wincolor', 'Special')

            return winid
        endfunction

        nnoremap <silent> <leader>zz :call Flt_term_win('lazygit',0.9,0.6,'Todo')<CR>

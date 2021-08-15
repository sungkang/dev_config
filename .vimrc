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

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
endif
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
set clipboard=unnamedplus
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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

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

nnoremap <silent> < 10<c-w><<cr>
nnoremap <silent> > 10<c-w>><cr>

noremap <leader>hh <c-w>H
noremap <leader>jj <c-w>J
noremap <leader>kk <c-w>K
noremap <leader>ll <c-w>L

" mappings: formatters
noremap <silent> <leader>jf :'<,'>!python -m json.tool<cr>
nnoremap <silent> <leader>xf :%!xmllint --format -<cr>

" mappings: diff
noremap <silent> <leader>dfa :windo diffthis<cr>
noremap <silent> <leader>dfo :windo diffoff<cr>

" mappings: date
" TODO: not there yet, I want it to paste at the current cursor
noremap <silent> <leader>td :put! =strftime('%a %B %d, %Y')<cr>

" fzf
noremap <silent> <c-p> :Files<cr>
noremap <silent> <leader>f :RG<cr>
noremap <silent> <leader>g :GFiles?<cr>

" This function makes ripgrepping behave like how finding in jetbrains works
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" gitgutter
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)
nmap <Leader>P <Plug>(GitGutterPreviewHunk)
nmap <Leader>+ <Plug>(GitGutterStageHunk)
nmap <Leader>- <Plug>(GitGutterUndoHunk)

" macros
runtime macros/matchit.vim

" runtimes
autocmd FileType lua nnoremap <buffer> <f9> :w<cr>:exec '!lua' shellescape(@%, 1)<cr>
autocmd FileType lua inoremap <buffer> <f9> <esc><esc>:w<cr>:exec '!lua' shellescape(@%, 1)<cr>
:map! <f9> <nop>

" development
" use deoplete
"let g:deoplete#enable_at_startup = 1

" commands
command! -nargs=* Wrap set wrap linebreak nolist
command EndOfLine normal! $

" journaling
let g:goyo_width = 120

function! s:goyo_enter()
    execute 'Limelight'
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    execute ‘Limelight!’
    “ Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr(‘$’)), ‘buflisted(v:val)’)) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

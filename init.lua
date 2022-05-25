local cmd = vim.cmd
local opt = vim.opt
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local Plug = vim.fn['plug#']

-- plugins
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'

-- telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'preservim/nerdtree'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tommcdo/vim-exchange'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-test/vim-test'

-- color schemes
Plug 'ellisonleao/gruvbox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'


Plug ('iamcco/markdown-preview.nvim', {['do'] = 'cd app && yarn install'})

-- lsp
Plug 'neovim/nvim-lspconfig'
Plug 'phpactor/phpactor'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' -- Snippets plugin

vim.call('plug#end')

vim.g.mapleader = ','

--------------
-- settings --
--------------
opt.showmode = false
opt.cursorline = true
opt.clipboard = 'unnamed'
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.foldenable = false
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.timeoutlen = 400
opt.ttimeoutlen = 10
opt.termguicolors = true
opt.mouse = 'nvi'

-- color scheme config
opt.background = "dark"
cmd('colorscheme gruvbox')

--------------
-- mappings --
--------------
-- general mappings
set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
set('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)
set('n', '<leader>/', ':noh<cr>', opts)
set('n', '<leader>q', ':q<cr>', opts)
set('n', '<leader>Q', ':q!<cr>', opts)
set('n', '<leader>w', ':w<cr>', opts)
set('n', 'U', '<c-r>', opts)

-- jump to normal mode in terminal
set('t', '<c-\\><c-\\>', '<c-\\><c-n>', opts)

-- navigation and search
set('n', 'L', 'Lzz', opts)
set('n', 'H', 'Hzz', opts)
set('n', 'n', 'nzz', opts)
set('n', 'N', 'Nzz', opts)
set('n', '<leader>,', ',', opts)

-- window management
set('n', '<c-h>', '<c-w>h', opts)
set('n', '<c-j>', '<c-w>j', opts)
set('n', '<c-k>', '<c-w>k', opts)
set('n', '<c-l>', '<c-w>l', opts)

-- quickfix
set('n', '[q', ':cp<cr>zz', opts)
set('n', ']q', ':cn<cr>zz', opts)

-- tab management
set('n', '<leader>tt', ':tabnew<cr>', opts)
set('n', '<leader>te', ':tabclose<cr>', opts)
set('n', '<s-tab>', ':tabp<cr>', opts)
set('n', '<tab>', ':tabn<cr>', opts)

-- splits
set('n', 'ss', ':split<cr><c-w>w', opts)
set('n', 'vs', ':vsplit<cr><c-w>w', opts)

-- resize splits
-- (vertical)
set('n', '_', '5<c-w><', opts)
set('n', '+', '5<c-w>>', opts)
-- (horizontal)
-- set('n', '?', '5<c-w>-', opts)
-- set('n', '?', '5<c-w>+', opts)

-- move around splits
set('n', '<leader>hh', '<c-w>H', opts)
set('n', '<leader>jj', '<c-w>J', opts)
set('n', '<leader>kk', '<c-w>K', opts)
set('n', '<leader>ll', '<c-w>L', opts)

-- buffers
set('n', '<c-f>', ':bn<cr>', opts)
set('n', '<c-b>', ':bp<cr>', opts)
set('n', '<leader>bb', ':bd<cr>', opts)
set('n', '<leader>ba', ':%bd<cr>', opts)

-- nerdtree
set('n', '<leader>n', ':NERDTreeToggle<cr>', opts)
set('n', '<leader>r', ':NERDTreeFind<cr>', opts)

-- fugitive
set('n', '<leader>gst', ':G<cr>', opts)
set('n', '<leader>ga', ':G blame<cr>', opts)
set('n', '<leader>gl', ':G log --graph<cr>', opts)
set('n', '<leader>gla', ':G log --graph --decorate --all<cr>', opts)

-- fzf
-- set('n', '<c-p>', ':Files<cr>', opts)
-- set('n', '<leader>f', ':RG<cr>', opts)
-- set('n', '<leader>b', ':Buffers<cr>', opts)
--
-- telescope
set('n', '<leader>ff', ':Telescope find_files<cr>', opts)
set('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
set('n', '<leader>fb', ':Telescope buffers<cr>', opts)
set('n', '<leader>fh', ':Telescope help_tags<cr>', opts)
set('n', '<leader>fs', ':Telescope lsp_document_symbols<cr>', opts)
set('n', '<leader>fr', ':Telescope lsp_references<cr>', opts)


-- formatting
set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

-- testing
set('n', '<space>t', ':TestNearest<cr>', opts)
set('n', '<space>T', ':TestFile<cr>', opts)
set('n', '<space>a', ':TestSuite<cr>', opts)
set('n', '<space>l', ':TestLast<cr>', opts)
set('n', '<space>g', ':TestVisit<cr>', opts)

----------------------
-- custom functions --
----------------------
-- This function makes ripgrepping behave like how finding in jetbrains works
cmd([[
    function! RipgrepFzf(query, fullscreen)
        let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
        let initial_command = printf(command_fmt, shellescape(a:query))
        let reload_command = printf(command_fmt, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
        call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
]])

-- enable jumping between <tags></tags> with %
cmd([[runtime macros/matchit.vim]])

-------------------
-- lualine setup --
-------------------
-- local theme = 'auto'
local theme = require('lualine.themes.gruvbox')
theme.normal.a.bg = '#bbd8e8'
require('lualine').setup({
    options = {
        theme = theme,
    },
})

---------------
-- telescope --
---------------
require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
            height = 0.7,
        },
        sorting_strategy = 'ascending',
    },
})

--------------
-- snippets --
--------------
require('luasnip.loaders.from_snipmate').load()

--------------
-- vim-test --
--------------
vim.g['test#strategy'] = 'dispatch'

----------------
-- lsp config --
----------------
local bset = vim.api.nvim_buf_set_keymap
local on_attach = function(client, bufnr)
    bset(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    bset(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    bset(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    bset(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    bset(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    bset(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'tsserver', 'phpactor', 'vuels', 'svelte' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

-- opt.completeopt = menu, menuone, noselect

local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
   })
})

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
   ensure_installed = 'all',
   sync_install = false,
   highlight = {
       enable = true,
       additional_vim_regex_highlighting = false,
   },
   indent = {
       enable = true,
   },
}

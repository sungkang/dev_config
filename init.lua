local cmd = vim.cmd
local opt = vim.opt
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local Plug = vim.fn['plug#']

-------------
-- plugins --
-------------
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

-- Lf
-- Plug 'ptzz/lf.vim'
-- Plug 'voldikss/vim-floaterm'

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
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

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
Plug 'RRethy/vim-illuminate'
Plug 'folke/trouble.nvim'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

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
opt.signcolumn = 'yes'
opt.updatetime = 100

-- color scheme config
opt.background = "dark"
cmd('colorscheme gruvbox')

--------------
-- mappings --
--------------
-- general mappings
set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
set('n', '<leader>vv', ':source $MYVIMRC<cr>', opts)
set('n', '<leader>/', ':noh<cr>', opts)
set('n', '<leader>q', ':q<cr>', opts)
set('n', '<leader>Q', ':q!<cr>', opts)
set('n', '<leader>w', ':w<cr>', opts)
set('n', '<leader>ee', ':e<cr>', opts)
set('n', 'U', '<c-r>', opts)

-- jump to normal mode in terminal
set('t', '<c-\\><c-\\>', '<c-\\><c-n>', opts)

-- navigation and search
set('n', 'L', 'Lzz', opts)
set('n', 'H', 'Hzz', opts)
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
set('n', '[t', ':tabp<cr>', opts)
set('n', ']t', ':tabn<cr>', opts)

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

-- buffers
set('n', '<c-f>', ':bn<cr>', opts)
set('n', '<c-b>', ':bp<cr>', opts)
set('n', '<leader>BB', ':bd<cr>', opts)
set('n', '<leader>BA', ':%bd<cr>', opts)

-- nerdtree
set('n', '<leader>n', ':NERDTreeToggle<cr>', opts)
set('n', '<leader>r', ':NERDTreeFind<cr>', opts)

-- mappings: diff
set('n', '<leader>dfa', ':windo diffthis<cr>', opts)
set('n', '<leader>dfo', ':windo diffoff<cr>', opts)

-- fugitive
set('n', '<space>gst', ':G<cr>', opts)
set('n', '<space>ga', ':G blame<cr>', opts)
set('n', '<space>gl', ':G log --graph<cr>', opts)
set('n', '<space>gla', ':G log --graph --decorate --all<cr>', opts)

-- telescope
set('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
set('n', '<leader>f', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
-- set('n', 'ga', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts)
-- set('n', '<leader>g', '<cmd>lua require("plugins.telescope").changed_on_branch()<cr>', opts)
set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
set('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
set('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
set('n', '<leader>k', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts)

-- trouble
set('n', '<leader>xx', ':Trouble<cr>', opts)
set('n', '<leader>xw', ':Trouble workspace_diagnostics<cr>', opts)
set('n', '<leader>xd', ':Trouble document_diagnostics<cr>', opts)

-- formatting
set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

-- testing
set('n', '<space>t', ':TestNearest<cr>', opts)
set('n', '<space>T', ':TestFile<cr>', opts)
set('n', '<space>a', ':TestSuite<cr>', opts)
set('n', '<space>l', ':TestLast<cr>', opts)
-- set('n', '<space>g', ':TestVisit<cr>', opts)

------------------
-- null-ls.nvim --
------------------
-- require('null-ls').setup{
--     sources = {
--         require('null-ls').builtins.diagnostics.eslint,
--     },
-- }


----------------------
-- pretty-fold.nvim --
----------------------
require('pretty-fold').setup{
    sections = {
      left = {
         'content', '    ', 'number_of_folded_lines', ': ', 'percentage', ' ',
      },
      right = {}
   },
    fill_char = ' '
}


---------------------------------
-- nvim-autopairs / ts-autotag --
---------------------------------
require('nvim-autopairs').setup{}
-- require('nvim-ts-autotag').setup()


----------------------------
-- indent blankline setup --
----------------------------
require("indent_blankline").setup {
    show_current_context = true,
}
vim.cmd('highlight IndentBlanklineContextChar guifg=#88aeb2 gui=nocombine')


------------------
-- trouble.nvim --
------------------
require('trouble').setup{}

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
    sections = {
        lualine_c = {
            {
               'filename',
                path = 1,
            }
        }
    }
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
        mappings = {
            n = {
              ["o"] = "select_default",
              ["q"] = "close",
            },
        }
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["dd"] = "delete_buffer",
                }
            },
            sort_mru = true,
            initial_mode = "normal",
        }
    }
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
    bset(bufnr, 'n', 'gt', '<cmd>lua require("telescope.builtin").treesitter()<cr>', opts)
    bset(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    bset(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode="normal"})<cr>', opts)
    bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    bset(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    bset(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    bset(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    bset(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references({initial_mode="normal", ignore_filename=true})<cr>', opts)
    bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    require('illuminate').on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'tsserver', 'phpactor', 'vuels', 'svelte', 'pyright', 'sumneko_lua', 'graphql' }
for _, lsp in pairs(servers) do
    local config = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }

    if lsp == 'sumneko_lua' then
        config.settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = {'vim'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        }
    end

    require('lspconfig')[lsp].setup(config)
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

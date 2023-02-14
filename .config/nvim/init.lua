local cmd = vim.cmd
local opts = { noremap = true, silent = true }

-- custom leader
vim.g.mapleader = ','

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)


-------------
-- plugins --
-------------
require("lazy").setup({
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-dispatch',
  'tpope/vim-dadbod',
  'tpope/vim-dotenv',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
  },
  'airblade/vim-gitgutter',
  'easymotion/vim-easymotion',
  'tommcdo/vim-exchange',
  'michaeljsmith/vim-indent-object',
  'vim-test/vim-test',
  'sainnhe/gruvbox-material',
  'sainnhe/everforest',
  'lukas-reineke/indent-blankline.nvim',
  'windwp/nvim-autopairs',
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  'RRethy/vim-illuminate',
  'folke/trouble.nvim',
  'folke/tokyonight.nvim',
  'anuvyklack/pretty-fold.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'mfussenegger/nvim-dap',
  'vimwiki/vimwiki',
  'numToStr/Comment.nvim',
  { 'catppuccin/nvim', name = "catppuccin" },
  {
    'fatih/vim-go',
    config = function()
      -- vim.cmd([[:GoUpdateBinaries]])
    end,
  },
  'leoluz/nvim-dap-go',
  'ThePrimeagen/harpoon',
  'voldikss/vim-floaterm',
  'akinsho/toggleterm.nvim',
  {
    'dstein64/vim-startuptime',
    cmd = "StartupTime",
  },
  'rebelot/kanagawa.nvim',
  {
    'declancm/cinnamon.nvim',
    opts = {
      default_delay = 1,
      extra_keymaps = true,
    },
  },
}, {
  performance = {
    cache = {
      enable = true,
    },
  },
})


-------------
-- configs --
-------------
require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()
require('plugins.treesitter').config()
require('plugins.lualine').config()
require('plugins.neo-tree').config()
require('plugins.pretty-fold').config()
require('plugins.vimwiki').config()
require('plugins.lsp').config()
require('plugins.nvim-dap').config()
require('plugins.telescope').config()
require('plugins.vim-test').config()
require('plugins.vim-floaterm').config()
-- require('plugins.nvim-test').config()

---------------------------------
-- nvim-autopairs / ts-autotag --
---------------------------------
require('nvim-autopairs').setup {}
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
require('trouble').setup {
  mode = 'document_diagnostics',
}

-- enable jumping between <tags></tags> with %
cmd('runtime macros/matchit.vim')

--------------
-- snippets --
--------------
require('luasnip.loaders.from_snipmate').lazy_load()

-----------------
-- code fences --
-----------------
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

----------------
-- lsp config --
----------------
local nvim_lsp = require('lspconfig')
local bset = vim.api.nvim_buf_set_keymap

local on_attach = function(client, bufnr)
  bset(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  bset(bufnr, 'n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  bset(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bset(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  bset(bufnr, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  bset(bufnr, 'n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  bset(bufnr, 'n', ']e', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  require('illuminate').on_attach(client)
end

-- update capabilities with completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- choose default formatters for certain lsps
local with_null_ls_formatter = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  on_attach(client, bufnr)
end

local servers = { 'tsserver', 'phpactor', 'volar', 'svelte', 'lua_ls', 'gopls', 'denols', 'cssls', 'prismals',
  'gdscript', 'pyright', 'html', 'tailwindcss' }
for _, lsp in pairs(servers) do
  local config = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  if lsp == 'volar' then
    -- goto continue
    config.root_dir = nvim_lsp.util.root_pattern('vue.config.js')
    config.filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
    -- config.on_attach = with_null_ls_formatter
  end

  if lsp == 'lua_ls' then
    config.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  if lsp == 'tsserver' then
    -- goto continue -- temp disable tsserver for vue dev (volar)
    config.root_dir = nvim_lsp.util.root_pattern('package.json')
    config.on_attach = with_null_ls_formatter
  end

  if lsp == 'denols' then
    config.root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc')
    config.single_file_support = false
    config.on_attach = with_null_ls_formatter
  end

  nvim_lsp[lsp].setup(config)
  -- ::continue::
end

-------------------------------------
-- mason.nvim (lsp server manager) --
-------------------------------------
require('mason').setup {}
require('mason-lspconfig').setup {}

-------------
-- Comment --
-------------
require('Comment').setup()

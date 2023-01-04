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
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'airblade/vim-gitgutter',
  'easymotion/vim-easymotion',
  'tommcdo/vim-exchange',
  'michaeljsmith/vim-indent-object',
  'vim-test/vim-test',
  'sainnhe/gruvbox-material',
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
  'anuvyklack/pretty-fold.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'mfussenegger/nvim-dap',
  'vimwiki/vimwiki',
  'numToStr/Comment.nvim',
  {
    'fatih/vim-go',
    config = function()
      -- vim.cmd([[:GoUpdateBinaries]])
    end,
  },
  'leoluz/nvim-dap-go',
  'ThePrimeagen/harpoon',
  'voldikss/vim-floaterm',
  'icatalina/vim-case-change',
  {
    'dstein64/vim-startuptime',
    cmd = "StartupTime",
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
require('plugins.nvim-tree').config()
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
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local on_attach = function(client, bufnr)
  bset(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bset(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  bset(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  bset(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
  bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
  require('illuminate').on_attach(client)

  -- if client.supports_method('textDocument/formatting') then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       vim.lsp.buf.format()
  --     end
  --   })
  -- end
end

-- update capabilities with completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- choose default formatters for certain lsps
local with_null_ls_formatter = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  on_attach(client, bufnr)
end

local servers = { 'tsserver', 'phpactor', 'volar', 'svelte', 'sumneko_lua', 'gopls', 'denols', 'cssls', 'prismals',
  'gdscript', 'pyright', 'html' }
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
    config.filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
    config.on_attach = with_null_ls_formatter
  end

  if lsp == 'sumneko_lua' then
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
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  if lsp == 'tsserver' then
    goto continue -- temp disable tsserver for vue dev (volar)
    config.root_dir = nvim_lsp.util.root_pattern('package.json')
    config.on_attach = with_null_ls_formatter
  end

  if lsp == 'denols' then
    config.root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc')
    config.single_file_support = false
    config.on_attach = with_null_ls_formatter
  end

  nvim_lsp[lsp].setup(config)
  ::continue::
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
-- local ft = require('Comment.ft')
-- ft.lang('javascript')

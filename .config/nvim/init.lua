-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = { noremap = true, silent = true }

-- custom leader
vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()

-------------
-- plugins --
-------------
require("lazy").setup({
  {
    import = "specs",
  },
  'nvim-lua/plenary.nvim',
  'vim-test/vim-test',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip',         -- Snippets plugin
  'RRethy/vim-illuminate',
  'nvimtools/none-ls.nvim',
  'mfussenegger/nvim-dap',
  {
    'fatih/vim-go',
    enabled = false,
    config = function()
      -- vim.cmd([[:GoUpdateBinaries]])
      -- vim.g.go_def_mode = 'gopls'
      -- vim.g.go_info_mode = 'gopls'
      -- vim.g.go_gopls_enabled = 0
    end,
  },
  'leoluz/nvim-dap-go',
  'akinsho/toggleterm.nvim',
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
require('core.mappings').config()
require('core.autocommands').config()
require('plugins.pretty-fold').config()
require('plugins.lsp').config()
require('plugins.nvim-dap').config()
require('plugins.vim-test').config()


-- enable jumping between <tags></tags> with %
vim.cmd('runtime macros/matchit.vim')

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
  bset(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  bset(bufnr, 'n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  bset(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bset(bufnr, 'n', '<space>c', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
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

local servers = { 'volar', 'tsserver', 'phpactor', 'svelte', 'lua_ls', 'gopls', 'denols', 'cssls', 'prismals',
  'gdscript', 'pyright', 'html', 'tailwindcss', 'emmet_ls', 'clangd' }
for _, lsp in pairs(servers) do
  local config = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  if lsp == 'volar' then
    config.root_dir = nvim_lsp.util.root_pattern('.vue')
    config.filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
    config.on_attach = with_null_ls_formatter
  end

  if lsp == 'tsserver' then
    config.root_dir = function(startpath)
      local vue_config_path
      vue_config_path = nvim_lsp.util.root_pattern('.vue')(startpath)
      if vue_config_path then
        return nil
      end
      return nvim_lsp.util.root_pattern('package.json')(startpath)
    end

    config.single_file_support = false
    config.on_attach = with_null_ls_formatter
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


  if lsp == 'denols' then
    config.root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc')
    config.single_file_support = false
    config.on_attach = with_null_ls_formatter
  end

  nvim_lsp[lsp].setup(config)
end

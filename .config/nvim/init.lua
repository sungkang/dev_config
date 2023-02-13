local opts = { noremap = true, silent = true }


-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)


require('core.options').config()
require('core.globals').config()
require('core.mappings').config()
require('core.lazy').config()
require('core.runtimes').config()
require('core.autocommands').config()
require('plugins.vimwiki').config()
require('plugins.lsp').config()
require('plugins.nvim-dap').config()
-- require('plugins.telescope').config()
require('plugins.vim-floaterm').config()

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
  require('lsp-format').on_attach(client)
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
        format = {
          defaultConfig = {
            indent_size = "2",
            continuation_indent = "2",
          },
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

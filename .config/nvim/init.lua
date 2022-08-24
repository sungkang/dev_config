local cmd = vim.cmd
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
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'

-- telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tommcdo/vim-exchange'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-test/vim-test'

-- color schemes
Plug 'sainnhe/gruvbox-material'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

-- lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
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
-- Plug 'folke/which-key.nvim'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'vimwiki/vimwiki'
Plug 'numToStr/Comment.nvim'
Plug('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install()'], ['for'] = { 'markdown', 'vim-plug' }})

vim.call('plug#end')

vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()
require('plugins.lsp').config()
require('plugins.nvim-tree').config()
require('plugins.telescope').config()
require('plugins.vimwiki').config()
require('plugins.treesitter').config()
require('plugins.pretty-fold').config()
require('plugins.lualine').config()

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
cmd([[runtime macros/matchit.vim]])

--------------
-- snippets --
--------------
require('luasnip.loaders.from_snipmate').load()


--------------
-- vim-test --
--------------
vim.g['test#strategy'] = 'dispatch'


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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- choose default formatters for certain lsps
local with_null_ls_formatter = function (client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  on_attach(client, bufnr)
end

local servers = { 'tsserver', 'phpactor', 'vuels', 'svelte', 'sumneko_lua', 'gopls', 'denols', 'cssls', 'prismals', 'sqlls', 'gdscript' }
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
    config.root_dir = nvim_lsp.util.root_pattern('package.json')
    config.on_attach = with_null_ls_formatter
  end

  if lsp == 'denols' then
    config.root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc')
    config.single_file_support = false
    config.on_attach = with_null_ls_formatter
  end

  nvim_lsp[lsp].setup(config)
end


--------------------
-- lsp completion --
--------------------
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


-------------------------------------
-- mason.nvim (lsp server manager) --
-------------------------------------
require('mason').setup {}
require('mason-lspconfig').setup {}

-------------
-- Comment --
-------------
require('Comment').setup()
local ft = require('Comment.ft')
ft.lang('javascript')


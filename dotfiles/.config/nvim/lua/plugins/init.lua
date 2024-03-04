return {
  'nvim-lua/plenary.nvim',
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = 1
      vim.g['test#basic#start_normal'] = 1
    end,
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      -- opt.completeopt = menu, menuone, noselect

      local luasnip = require('luasnip')
      local cmp = require('cmp')

      luasnip.setup({
        region_check_events = "CursorMovedI",
      })

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
    end
  },
  'RRethy/vim-illuminate',
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local bset = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }
      local null_ls = require('null-ls')

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.pg_format,
        },
        on_attach = function(client, bufnr)
          bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        end
      }
    end
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
    end
  },
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
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-dotenv',
  'easymotion/vim-easymotion',
  {
    'airblade/vim-gitgutter',
    config = function()
      vim.g.gitgutter_grep = 'rg'
    end
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_folding = 'expr'
      vim.g.vimwiki_list = {
        {
          path = '~/.local/share/vimwiki/purina_just_right',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/.local/share/vimwiki/personal',
          syntax = 'markdown',
          ext = '.md',
        },
      }
    end
  },
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {
        sections = {
          left = {
            'content', '    ', 'number_of_folded_lines', ': ', 'percentage', ' ',
          },
          right = {}
        },
        fill_char = ' '
      }
    end
  },
  'tommcdo/vim-exchange',
  'michaeljsmith/vim-indent-object',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup {}
      vim.cmd('highlight IndentBlanklineContextChar guifg=#88aeb2 gui=nocombine')
    end
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'folke/neodev.nvim',
    config = true,
  },
  {
    'folke/trouble.nvim',
    opts = { mode = 'document_diagnostics' },
  },
  {
    'zbirenbaum/copilot.lua',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
          }
        }
      })
    end,
  },
}

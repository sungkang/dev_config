return {
  'nvim-lua/plenary.nvim',
  {
    enabled = true,
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-p>'] = false,
          ['<C-s>'] = false,
          ['<BS>'] = function ()
            require('oil').open()
          end,
          ['q'] = function()
            require('oil').close()
          end,
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          max_width = 100,
          max_height = 50,
        },
      }

      -- Open parent directory in current window
      -- vim.keymap.set('n', '-', '<Cmd>lua require("oil").open_float()<CR>', { desc = 'Open parent directory' })
      -- vim.keymap.set('n', '<Space>o', '<Cmd>lua require("oil").open_float()<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '-', '<Cmd>lua require("oil").open()<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<Space>o', '<Cmd>lua require("oil").open()<CR>', { desc = 'Open parent directory' })
    end,
  },
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = 1
      vim.g['test#basic#start_normal'] = 1
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'RRethy/vim-illuminate',
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
    enabled = false,
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
    keys = {
      { '<leader>ce', '<Cmd>Copilot enable<CR>' },
      { '<leader>cd', '<Cmd>Copilot disable<CR>' },
      { '<leader>cs', '<Cmd>Copilot status<CR>' },
    },
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}

return {
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
  'anuvyklack/pretty-fold.nvim',
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
    'declancm/cinnamon.nvim',
    enabled = false,
    opts = {
      default_delay = 1,
      extra_keymaps = true,
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
    config = function ()
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

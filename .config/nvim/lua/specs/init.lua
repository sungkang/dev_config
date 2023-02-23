return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-dotenv',
  'easymotion/vim-easymotion',
  'airblade/vim-gitgutter',
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  'vimwiki/vimwiki',
  'anuvyklack/pretty-fold.nvim',
  'tommcdo/vim-exchange',
  'michaeljsmith/vim-indent-object',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
      }
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
}

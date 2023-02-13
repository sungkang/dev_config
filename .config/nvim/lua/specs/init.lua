local opts = { noremap = true, silent = true }

return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'tpope/vim-fugitive',
    keys = {
      { '<space>ga',  ':G blame<cr>',                        opts },
      { '<space>gst', ':G<cr>',                              opts },
      { '<space>gl',  ':G log --graph<cr>',                  opts },
      { '<space>gla', ':G log --graph --decorate --all<cr>', opts },
    },
  },
  'tpope/vim-dispatch',
  'tpope/vim-dadbod',
  'tpope/vim-dotenv',
  'nvim-lua/plenary.nvim',
  {
    'airblade/vim-gitgutter',
    keys = {
      { '<space>hp', '<cmd>GitGutterPreviewHunk<cr>', opts },
      { '<space>hs', '<cmd>GitGutterStageHunk<cr>',   opts },
      { '<space>hu', '<cmd>GitGutterUndoHunk<cr>',    opts },
    },
  },
  'easymotion/vim-easymotion',
  'tommcdo/vim-exchange',
  'michaeljsmith/vim-indent-object',
  {
    'lukas-reineke/indent-blankline.nvim',
    name = 'indent_blankline',
    opts = { show_current_context = true },
    config = function(plugin, options)
      require(plugin.name).setup(options)
      vim.cmd('highlight IndentBlanklineContextChar guifg=#88aeb2 gui=nocombine')
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    dependencies = {
      'williamboman/mason.nvim',
    }
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  'RRethy/vim-illuminate',
  {
    'folke/trouble.nvim',
    opts = { mode = 'document_diagnostics' },
    keys = {
      { '<leader>xx', ':TroubleToggle<cr>',                 opts },
      { '<leader>xw', ':Trouble workspace_diagnostics<cr>', opts },
      { '<leader>xd', ':Trouble document_diagnostics<cr>',  opts },
    },
  },
  {
    'anuvyklack/pretty-fold.nvim',
    opts = {
      sections = {
        left = {
          'content', '    ', 'number_of_folded_lines', ': ', 'percentage', ' ',
        },
        right = {}
      },
      fill_char = ' '
    },
  },
  'jose-elias-alvarez/null-ls.nvim',
  'mfussenegger/nvim-dap',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'nvim-neotest/neotest-go',
    },
    keys = {
      { '<space>tt', '<cmd>lua require("neotest").run.run()<cr>',             opts },
      { '<space>to', '<cmd>lua require("neotest").output_panel.toggle()<cr>', opts },
      { '<space>ts', '<cmd>lua require("neotest").summary.toggle()<cr>',      opts },
    },
    config = function(plugin)
      require(plugin.name).setup({
        adapters = {
          require('neotest-go'),
          require('neotest-jest')({
            jestCommand = 'npm run test:unit --',
          }),
        },
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
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
  {
    'folke/neodev.nvim',
    config = true,
  },
  {
    'lukas-reineke/lsp-format.nvim',
    config = true,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}

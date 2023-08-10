return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-go',
      'haydenmeade/neotest-jest',
      'nvim-neotest/neotest-vim-test',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          -- require('neotest-jest')({
          --   jestCommand = "npm run test:unit --",
          -- }),
          require('neotest-go')({}),
          require('neotest-vim-test')({ ignore_filetypes = { }}),
        },
      })

      vim.keymap.set('n', '<space>ts', '<Cmd>lua require("neotest").summary.toggle()<CR>')
      vim.keymap.set('n', '<space>to', '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
      vim.keymap.set('n', '<space>ta', '<Cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>')
      vim.keymap.set('n', '<space>tn', '<Cmd>lua require("neotest").run.run()<CR>')
      vim.keymap.set('n', '<space>tt', '<Cmd>lua require("neotest").run.run_last()<CR>')
    end,
    keys = { '<space>ts', '<space>ta' },
  },
}

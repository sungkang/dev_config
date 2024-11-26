return {
  {
    enabled = false,
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-go',
      'marilari88/neotest-vitest',
      'thenbe/neotest-playwright',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-go')({}),
          require('neotest-vitest')({}),
          require('neotest-playwright').adapter({
            options = {
              enable_dynamic_test_discovery = true,
            }
          }),
        },
      })

      vim.keymap.set('n', '<space>ts', '<Cmd>lua require("neotest").summary.toggle()<CR>')
      vim.keymap.set('n', '<space>to', '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
      vim.keymap.set('n', '<space>tc', '<Cmd>lua require("neotest").output_panel.clear()<CR>')
      vim.keymap.set('n', '<space>ta', '<Cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>')
      vim.keymap.set('n', '<space>tn', '<Cmd>lua require("neotest").run.run()<CR>')
      vim.keymap.set('n', '<space>tt', '<Cmd>lua require("neotest").run.run_last()<CR>')
    end,
    keys = { '<space>ts', '<space>ta' },
  },
}

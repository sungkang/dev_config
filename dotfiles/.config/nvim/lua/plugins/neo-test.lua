return {
  {
    enabled = true,
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'fredrikaverpil/neotest-golang',
      'marilari88/neotest-vitest',
      'thenbe/neotest-playwright',
    },
    config = function()
      local utils = require("utils")
      local env_vars = utils.load_env(vim.fn.getcwd() .. "/.env")

      require('neotest').setup({
        adapters = {
          require('neotest-golang')({
            env = env_vars,
          }),
          require('neotest-vitest')({
            filter_dir = function(_, rel_path, _)
              return not string.match(rel_path, "playwright")
                  and not string.match(rel_path, "node_modules")
            end,
          }),
          require('neotest-playwright').adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
              filter_dir = function(_, rel_path, _)
                return string.match(rel_path, "playwright")
              end,
            },
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

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }
      local dap = require('dap')

      local adapters = {
        node = {
          adapter = {
            type = 'executable',
            command = 'node-debug2-adapter',
            args = {},
          },
          config = {
            type = 'node',
            name = 'node debugger',
          },
        },
        go = {
          adapter = {
            type = 'server',
            port = '${port}',
            executable = {
              command = 'dlv',
              args = { 'dap', '--log', '-l', '127.0.0.1:${port}' },
            },
          },
          config = {
            {
              type = "go",
              name = "Debug",
              request = "launch",
              program = "${file}",
            },
            {
              type = "go",
              name = "Debug test", -- configuration for debugging test files
              request = "launch",
              mode = "test",
              program = "${file}",
            },
            -- works with go.mod packages and sub packages
            {
              type = "go",
              name = "Debug test (go.mod)",
              request = "launch",
              mode = "test",
              program = "./${relativeFileDirname}",
            },
          },
        }
      }

      for key, value in pairs(adapters) do
        dap.adapters[key] = value.adapter
        dap.configurations[key] = value.config
      end

      -- mappings
      set('n', '<F8>', '<cmd>lua require("dap").continue()<cr>', opts)
      set('n', '<F10>', '<cmd>lua require("dap").step_over()<cr>', opts)
      set('n', '<F11>', '<cmd>lua require("dap").step_into()<cr>', opts)
      set('n', '<F12>', '<cmd>lua require("dap").step_out()<cr>', opts)
      set('n', '<space>bb', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
      set('n', '<space>dr', '<cmd>lua require("dap").repl.open()<cr>', opts)
      set('n', '<space>dl', '<cmd>lua require("dap").run_last()<cr>', opts)
    end
  },
}

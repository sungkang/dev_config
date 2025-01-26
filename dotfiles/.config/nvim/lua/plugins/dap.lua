return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")
      ui.setup()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Attach Remote",
            mode = "remote",
            request = "attach",
          },
        }
      })
      require("nvim-dap-virtual-text").setup()

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>v", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F9>", dap.continue)
      vim.keymap.set("n", "<F8>", dap.step_over)
      vim.keymap.set("n", "<F7>", dap.step_into)
      vim.keymap.set("n", "<S-F7>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}

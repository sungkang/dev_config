return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "igorlfs/nvim-dap-view",
    },
    config = function()
      local dap = require("dap")
      local dv = require("dap-view")
      require('dap-go').setup()

      vim.api.nvim_set_hl(0, "DapRed", { fg = "#d31617" })
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapRed", numhl = "DiagnosticError" })

      vim.api.nvim_set_hl(0, "DapStoppedFG", { fg = "#c6d525" })
      vim.api.nvim_set_hl(0, "DapStoppedBG", { bg = "#2f8f77" })
      vim.fn.sign_define("DapStopped",
        { text = ">>", texthl = "DapStoppedFG", numhl = "DapStoppedFG", linehl = "DapStoppedBG" })

      require("nvim-dap-virtual-text").setup({
        clear_on_continue = true,
      })

      -------------
      -- keymaps --
      -------------
      vim.keymap.set("n", "<space>bb", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>ba", dap.clear_breakpoints)
      vim.keymap.set("n", "<space>dc", dap.continue)
      vim.keymap.set("n", "<space>de", dap.terminate)
      vim.keymap.set("n", "<space>gc", dap.run_to_cursor)

      vim.keymap.set("n", "<F9>", dap.continue)
      vim.keymap.set("n", "<F8>", dap.step_over)
      vim.keymap.set("n", "<F7>", dap.step_into)
      vim.keymap.set("n", "<S-F7>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      vim.keymap.set("n", "<space>dv", dv.toggle)
    end,
  },
}

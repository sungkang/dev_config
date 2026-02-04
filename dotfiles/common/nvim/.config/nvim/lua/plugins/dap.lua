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
      local utils = require("utils")
      require('dap-go').setup()

      -- Inject .env vars into all Go debug configurations
      for _, config in ipairs(dap.configurations.go) do
        local original_env = config.env or {}
        -- Use a function so it loads fresh env vars each time
        ---@diagnostic disable-next-line: assign-type-mismatch
        config.env = function()
          local env_vars = utils.load_env(vim.fn.getcwd() .. "/.env")
          return vim.tbl_extend("force", original_env, env_vars)
        end
      end

      vim.api.nvim_set_hl(0, "DapRed", { fg = "#d31617" })
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapRed", numhl = "DiagnosticError" })

      vim.api.nvim_set_hl(0, "DapStoppedFG", { fg = "#c6d525" })
      vim.api.nvim_set_hl(0, "DapStoppedBG", { bg = "#2f8f77" })
      vim.fn.sign_define("DapStopped",
        { text = ">>", texthl = "DapStoppedFG", numhl = "DapStoppedFG", linehl = "DapStoppedBG" })

      -- require("nvim-dap-virtual-text").setup({
      --   clear_on_continue = true,
      -- })

      -------------
      -- keymaps --
      -------------
      vim.keymap.set("n", "<space>bb", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>ba", dap.clear_breakpoints)
      vim.keymap.set("n", "<space>dd", dap.continue)
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

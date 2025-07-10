return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      local function find_env_file()
        local current_dir = vim.fn.getcwd()
        local env_file = '.env'

        while current_dir ~= '/' do
          local env_path = current_dir .. '/' .. env_file
          if vim.fn.filereadable(env_path) == 1 then
            return env_path
          end
          current_dir = vim.fn.fnamemodify(current_dir, ':h')
        end
        return nil
      end

      -- Function to load the .env file
      local function load_env_file(file_path)
        local env_vars = {}
        for line in io.lines(file_path) do
          local key, value = line:match("^(.-)=(.*)$")
          if key and value then
            env_vars[key] = value
          end
        end
        return env_vars
      end

      -- Locate and load the .env file
      local env_file_path = find_env_file()
      local env_vars = {}
      if env_file_path then
        env_vars = load_env_file(env_file_path)
      else
        print('.env file not found in project root or parent directories')
      end

      ui.setup()

      require("dap-go").setup()
      require("dap").configurations.go = {
        {
          type = "go",
          name = "Debug Go",
          request = "launch",
          program = "${fileDirname}",
          env = env_vars,
        },
        {
          type = "go",
          name = "Attach Remote",
          mode = "remote",
          request = "attach",
          port = 43000,
          host = "127.0.0.1",
        },
      }

      vim.api.nvim_set_hl(0, "DapRed", { fg = "#d31617" })
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl="DapRed", numhl = "DiagnosticError" })

      vim.api.nvim_set_hl(0, "DapStoppedFG", { fg = "#c6d525" })
      vim.api.nvim_set_hl(0, "DapStoppedBG", { bg = "#2f8f77" })
      vim.fn.sign_define("DapStopped", { text = ">>", texthl="DapStoppedFG", numhl = "DapStoppedFG", linehl = "DapStoppedBG" })

      require("nvim-dap-virtual-text").setup({})

      -------------
      -- keymaps --
      -------------
      vim.keymap.set("n", "<space>bb", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>ba", dap.clear_breakpoints)
      vim.keymap.set("n", "<space>dd", function() ui.toggle({reset = true}) end)
      vim.keymap.set("n", "<space>dc", dap.continue)
      vim.keymap.set("n", "<space>dt", dap.terminate)
      vim.keymap.set("n", "<space>gc", dap.run_to_cursor)

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


      --------------------------------
      -- nvim-dap-ui event handlers --
      --------------------------------
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

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

      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug Go",
            request = "launch",
            program = "${fileDirname}",
            env = env_vars,
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

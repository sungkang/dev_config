return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        preset = {
          header = [[
⠀⠀⠀⢀⠀⠈⢹⣇⢀⣾⠠⠚⢿⡃⠈⡩⠟⠋⠁⠀⠀⠉⠉⣻⣿⠀⠀⠀⢹⣿
⠀⠀⠀⢸⣦⣤⣿⣿⣾⡅⠀⠀⠨⣷⡾⠀⠀⠀⠀⠀⠀⠀⠐⢿⣯⠀⠀⠀⠸⣿
⣀⣀⣰⣿⣿⣿⣿⣿⣿⡃⠀⠘⣀⣿⠗⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠀⠀⠀⢀⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠀⢀⠀⣸⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠠⠀⠁⠂⠀⠀⠀⠀⠀⢸⣿⣿⣿⠀⣼⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢫⡄⠀⠀⠀⠀⢾⣿⣿⣿⠄⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣿⡅⣠⣤⣤⣬⠤⣄⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣁⣠⣿⣦⣄⣤⡧⠀⠀⢻⣿⣿⣿⣟⣏⠙⣿⣯
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢻⡯⣉⠽⢿⠻⠛⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠈⠀⣀⣀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡔⠲⠦⠀⠂⠐⠂⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡏⢹⡿⠛⠓⠠⢄⡀⠀⠀⠀⠀⠀⣀⣄⣀⠈⢻⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣄⢙⣾⣿⡇⠀⡷⠆⠁⠀⠀⠀⡠⢻⣿⡿⠛⠀⠘⢿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠝⠃⢠⣀⣀⣦⣄⡀⠀⠂⣠⡎⠁⢸⠏⠀⠀⠀⠀⠀⠹⣿⣿⣿
⣿⣿⣿⣿⠟⠁⠀⠀⠀⠈⠙⠛⠛⠛⠀⠀⠈⠁⠀⢏⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿
⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿
⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿
⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿
⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿
⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿
          ]],
        },
        enabled = true,
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      dim = {
        enabled = true,
        animate = {
          duration = {
            step = 10,
            total = 150,
          }
        }
      },
      indent = {
        enabled = true,
        animate = {
          duration = {
            step = 10,
            total = 150,
          }
        }
      },
      scratch = {
        enabled = true,
        win = { style = "scratch" },
      },
      lazygit = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
    },
    keys = {
      { "<leader>D", function() Snacks.dashboard() end,      desc = "Go to Dashboard" },
      { "<leader>.", function() Snacks.scratch.open() end,   desc = "Toggle Scratch Buffer" },
      { "<leader>n", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>g", function() Snacks.lazygit.open() end },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    -- lazy = false,
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<Space>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer with conform.nvim",
      },
    },
    -- This will provide type hinting with LuaLS
    -- @module "conform"
    -- @type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        xml = { "xmllint" },
        json = { "jq" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        -- lua = { "stylua" },
        -- python = { "isort", "black" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500 },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  "tpope/vim-abolish",
  {
    "numToStr/Comment.nvim",
    enabled = true,
    config = true,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-p>"] = false,
          ["<C-s>"] = false,
          ["<BS>"] = function()
            require("oil").open()
          end,
          ["q"] = function()
            require("oil").close()
          end,
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          max_width = 100,
          max_height = 50,
        },
      })

      -- Open parent directory in current window
      -- vim.keymap.set('n', '-', '<Cmd>lua require("oil").open_float()<CR>', { desc = 'Open parent directory' })
      -- vim.keymap.set('n', '<Space>o', '<Cmd>lua require("oil").open_float()<CR>', { desc = 'Open parent directory' })
      vim.keymap.set("n", "-", '<Cmd>lua require("oil").open()<CR>', { desc = "Open parent directory" })
      vim.keymap.set("n", "<Space>o", '<Cmd>lua require("oil").open()<CR>', { desc = "Open parent directory" })
    end,
  },
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#start_normal"] = 1
      vim.g["test#basic#start_normal"] = 1
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  "RRethy/vim-illuminate",
  {
    "mfussenegger/nvim-dap",
    config = function() end,
  },
  "leoluz/nvim-dap-go",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-dotenv",
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.g.gitgutter_grep = "rg"
    end
  },
  {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_folding = "expr"
      vim.g.vimwiki_list = {
        {
          path = "~/.local/share/vimwiki/purina_just_right",
          syntax = "markdown",
          ext = ".md",
        },
        {
          path = "~/.local/share/vimwiki/personal",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  },
  "tommcdo/vim-exchange",
  "michaeljsmith/vim-indent-object",
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  "folke/lazydev.nvim",
  {
    "folke/trouble.nvim",
    opts = { mode = "document_diagnostics" },
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", silent = true, desc = "Open Trouble" },
      { "<leader>xl", "<Cmd>Trouble loclist<CR>",            silent = true, desc = "Open Location Trouble" },
      { "<leader>xq", "<Cmd>Trouble quickfix toggle<CR>",    silent = true, desc = "Open Quickfix Trouble" },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    lazy = true,
    event = "InsertEnter",
    keys = {
      { "<leader>ce", "<Cmd>Copilot enable<CR>" },
      { "<leader>cd", "<Cmd>Copilot disable<CR>" },
      { "<leader>cs", "<Cmd>Copilot status<CR>" },
    },
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
          },
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "folke/noice.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          -- bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undotree" })
    end
  },
}

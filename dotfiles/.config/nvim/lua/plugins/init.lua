return {
  {
    "sindrets/diffview.nvim",
    enabled = true,
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    enabled = false,
    config = function()
      require("obsidian").setup({
        ui = {
          enable = false,
        },
        workspaces = {
          {
            name = "personal",
            path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Me"
          },
          {
            name = "work",
            path = "~/dev/work/cac_platform/cac_platform_docs/obsidian/CAC"
          },
        },
        daily_notes = {
          folder = "daily",
          date_format = "%Y-%m-%d",
        },
      })

      vim.keymap.set("n", "<space>ow", "<Cmd>ObsidianWorkspace<CR>", { desc = "Select an Obsidian Workspace" })
      vim.keymap.set("n", "<space>on", "<Cmd>ObsidianNew<CR>", { desc = "Create a new Note" })
      vim.keymap.set("n", "<space>os", "<Cmd>ObsidianSearch<CR>", { desc = "Search for a Note" })
      vim.keymap.set("n", "<space>ot", "<Cmd>ObsidianToday<CR>", { desc = "Create or goto today's daily" })
    end,
  },
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
      notifier = { enabled = false },
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
    "catgoose/nvim-colorizer.lua",
    enabled = false,
    config = function()
      require("colorizer").setup({
        css = { rgb_fn = true, },
        -- ts = { rgb_fn = true, },
        html = { names = false, },
      })
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = true,
    config = function()
      require("nvim-highlight-colors").setup({
        enable_tailwind = true,
      })
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
        javascript = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        vue = { "prettier", stop_after_first = true },
        -- lua = { "stylua" },
        -- python = { "isort", "black" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500 },
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

      vim.keymap.set("n", "-", '<Cmd>lua require("oil").open()<CR>', { desc = "Open parent directory" })
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
    enabled = false,
    config = function()
      vim.g.vimwiki_folding = "expr"
      vim.g.vimwiki_list = {
        {
          path = "/Users/skang/.local/share/vimwiki/personal",
          syntax = "markdown",
          ext = ".md",
        },
        {
          path = "/Users/skang/.local/share/vimwiki/purina_just_right",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  },
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
    event = "InsertEnter",
    keys = {
      { "<leader>CC", "<Cmd>Copilot enable<CR>" },
      { "<leader>CD", "<Cmd>Copilot disable<CR>" },
      { "<leader>CS", "<Cmd>Copilot status<CR>" },
    },
    config = function()
      require("copilot").setup({
        server_opts_overrides = {
          settings = {
            telemetry = {
              telemetryLevel = "off",
            },
          },
        },
        copilot_node_command = "/opt/homebrew/bin/node",
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
}

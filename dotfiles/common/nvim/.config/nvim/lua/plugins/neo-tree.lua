return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function()
      require('window-picker').setup()
      require('neo-tree').setup({
        default_component_configs = {
          indent = {
            with_expanders = true,
          },
          file_size = {
            enabled = true,
            width = 12,
            required_width = 64, -- only show when window is at least this wide
          },
          type = {
            enabled = false, -- drop the "sql" column entirely
          },
          last_modified = {
            enabled = true,
            width = 20,
            required_width = 88,
            format = "relative", -- "3 days ago" instead of a timestamp
          },
          created = {
            enabled = false,
          },
        },
        window = {
          position = "float",
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["o"] = "open_with_window_picker",
            ["x"] = "close_node",
            ["X"] = "cut_to_clipboard",
            ["W"] = "close_all_nodes",
            ["z"] = "",
            ["H"] = "",
            ["h"] = "toggle_hidden",
            ["/"] = "",
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.cmd [[ setlocal relativenumber ]]
            end
          },
        },
      })

      -- mappings
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }

      set('n', '<leader>r', ':Neotree reveal reveal_force_cwd<cr>', opts)
    end
  },
}

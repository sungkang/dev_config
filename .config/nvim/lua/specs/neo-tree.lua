return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function()
      require('window-picker').setup {}
      require('neo-tree').setup {
        default_component_configs = {
          indent = {
            with_expanders = true,
          },
        },
        window = {
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
          follow_current_file = true,
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
      }
    end
  },
}

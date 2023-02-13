M = {}

M.config = function()
  require('window-picker').setup {}
  require('neo-tree').setup {
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
  }
end

return M

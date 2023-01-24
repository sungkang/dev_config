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
        ["o"] = "toggle_node",
        ["x"] = "close_node",
        ["X"] = "cut_to_clipboard",
      },
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  }
end

return M

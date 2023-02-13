local opts = { noremap = true, silent = true }

return {
  'nvim-neo-tree/neo-tree.nvim',
  name = 'neo-tree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    's1n7ax/nvim-window-picker',
  },
  keys = {
    { '<leader>n', ':Neotree toggle reveal reveal_force_cwd<cr>', opts },
    { '<leader>r', ':Neotree reveal reveal_force_cwd<cr>', opts },
  },
  opts = {
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
  },
  config = function(plugin, options)
    require('window-picker').setup({})
    require(plugin.name).setup(options)
  end
}

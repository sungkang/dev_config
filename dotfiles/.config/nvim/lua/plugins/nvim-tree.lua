M = {}

M.config = function()
  require('nvim-tree').setup {
    filesystem_watchers = {
      enable = true,
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      adaptive_size = true,
      preserve_window_proportions = true,
      mappings = {
        list = {
          { key = 'x', action = 'close_node' },
          { key = 'X', action = 'cut' },
          { key = 'H', action = '' },
          { key = 'D', action = 'toggle_dotfiles' },
        }
      },
    },
    renderer = {
      icons = {
        glyphs = {
          git = {
            untracked = '*',
          },
        },
      },
    },
    live_filter = {
      always_show_folders = false,
    },
    git = {
      ignore = false,
    }
  }
end

return M

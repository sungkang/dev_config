-- default --
-- local theme = 'auto'

-- gruvbox --
-- local theme = require('lualine.themes.gruvbox')
-- theme.normal.a.bg = '#bbd8e8'

local theme = 'kanagawa'

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = theme,
    },
    sections = {
      -- lualine_b = {
      --   'diff', 'diagnostics'
      -- },
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      }
    },
    inactive_sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      }
    },
  }
}

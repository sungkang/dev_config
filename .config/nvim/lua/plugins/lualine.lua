local M = {}

M.config = function()
  -- local theme = 'auto'
  local theme = require('lualine.themes.gruvbox')
  theme.normal.a.bg = '#bbd8e8'
  require('lualine').setup({
    options = {
      theme = theme,
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      }
    }
  })
end

return M
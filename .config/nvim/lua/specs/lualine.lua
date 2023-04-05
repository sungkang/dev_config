return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local theme = 'auto'
      -- theme.normal.a.bg = '#bbd8e8'
      require('lualine').setup({
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
      })
    end
  },
}

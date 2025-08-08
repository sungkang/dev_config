return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local function nvim_pid()
        return "pid:" .. vim.fn.getpid()
      end

      local theme = 'auto'
      -- theme.normal.a.bg = '#bbd8e8'
      require('lualine').setup({
        options = {
          theme = theme,
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
          lualine_b = { 'diagnostics' },
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {nvim_pid, 'filetype'},
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

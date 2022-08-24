local M = {}

M.config = function()
  require('pretty-fold').setup {
    sections = {
      left = {
        'content', '    ', 'number_of_folded_lines', ': ', 'percentage', ' ',
      },
      right = {}
    },
    fill_char = ' '
  }
end

return M

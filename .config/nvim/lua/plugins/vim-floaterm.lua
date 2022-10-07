local M = {}

M.config = function ()
  local set = vim.keymap.set
  local opts = { noremap = true, silent = true }

  vim.g.floaterm_width = 0.95
  vim.g.floaterm_height = 0.95
  set('n', '<leader>g', ':FloatermNew lazygit<cr>')
end

return M

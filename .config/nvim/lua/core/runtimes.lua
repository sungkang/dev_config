local M = {}

M.config = function()
  -- enable jumping between <tags></tags> with %
  vim.cmd('runtime macros/matchit.vim')
end

return M

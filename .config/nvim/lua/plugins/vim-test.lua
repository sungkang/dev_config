local M = {}

M.config = function ()
  vim.g['test#strategy'] = 'neovim'
  vim.g['test#neovim#start_normal'] = 1
  vim.g['test#basic#start_normal'] = 1
end

return M

local M = {}

M.config = function ()
   CONFIG_PATH = vim.fn.stdpath('config')
end

return M

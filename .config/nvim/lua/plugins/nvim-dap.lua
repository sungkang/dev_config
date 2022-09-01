local M = {}

M.config = function ()
  local dap = require('dap') 

  dap.adapters.node = {
    type = 'executable',
    command = '/Users/skang/.local/share/nvim/mason/bin/node-debug2-adapter',
    args = {},
  }

  dap.configurations.node = {
    type = 'node',
    name = 'node debugger',
  }

end

return M

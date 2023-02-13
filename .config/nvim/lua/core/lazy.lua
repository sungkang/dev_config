local M = {}

M.config = function()
  require('lazy').setup('specs', {
    performance = {
      cache = {
        enable = true,
      },
    },
  })
end

return M

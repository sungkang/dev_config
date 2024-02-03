local M = {}

M.setup_servers = function ()
  -- do nothing  
end

M.config = function ()
  require('lspconfig')
  require('plugins.lsp.null-ls').config()
  require('plugins.lsp.cmp').config()
end

return M

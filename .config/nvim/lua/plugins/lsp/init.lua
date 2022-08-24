M = {}

M.setup_servers = function ()
  -- do nothing  
end

M.config = function ()
  require('lspconfig')
  require('plugins.lsp.null-ls').config()
end

return M

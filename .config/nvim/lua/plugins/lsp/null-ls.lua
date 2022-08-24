M = {}

M.config = function()
  require('null-ls').setup {
    sources = {
      require('null-ls').builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file('package.json')
        end
      }),
      require('null-ls').builtins.formatting.prettierd,
    },
  }
end

return M

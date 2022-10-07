M = {}

M.config = function()
  local null_ls = require('null-ls')

  null_ls.setup {
    sources = {
      null_ls.builtins.diagnostics.eslint.with({
        condition = function(utils)
          return utils.root_has_file('package.json')
        end
      }),
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.prettierd,
    },
  }
end

return M

local bset = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

local M = {}

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
      null_ls.builtins.formatting.pg_format,
    },
    on_attach = function(client, bufnr)
      bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end
  }
end

return M

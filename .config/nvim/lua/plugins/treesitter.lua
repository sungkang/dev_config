local M = {}

M.config = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  }
end

return M

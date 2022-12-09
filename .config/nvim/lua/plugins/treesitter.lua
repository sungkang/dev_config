local M = {}

M.config = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        local num_of_lines = vim.api.nvim_buf_line_count(bufnr)
        return string.find(buf_name, '.sql') and num_of_lines > 1000
      end
    },
    indent = {
      enable = true,
    },
  }
end

return M

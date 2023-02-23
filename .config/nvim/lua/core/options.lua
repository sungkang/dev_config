local M = {}

M.config = function()
  local opt = vim.opt

  opt.showmode = false
  opt.cursorline = true
  opt.clipboard = 'unnamed'
  opt.ignorecase = true
  opt.smartcase = true
  opt.infercase = true
  opt.number = true
  opt.relativenumber = true
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
  opt.foldenable = false
  opt.foldmethod = 'expr'
  opt.foldexpr = 'nvim_treesitter#foldexpr()'
  opt.timeoutlen = 400
  opt.ttimeoutlen = 10
  opt.termguicolors = true
  opt.mouse = 'nvi'
  opt.signcolumn = 'yes'
  opt.updatetime = 100
  opt.conceallevel = 0
  vim.g.do_filetype_lua = 1
  -- opt.cmdheight = 0

  -- color scheme config
  opt.background = 'dark'

end

return M

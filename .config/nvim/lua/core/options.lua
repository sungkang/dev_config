local M = {}

M.config = function()
  local cmd = vim.cmd
  local opt = vim.opt

  vim.g.mapleader = ','

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
  -- opt.cmdheight = 0

  -- color scheme config
  opt.background = 'dark'
  vim.g.gruvbox_material_background = 'medium'
  vim.g.gruvbox_material_visual = 'reverse'
  cmd('colorscheme gruvbox-material')
  cmd('highlight CursorLine guibg=#3f3d3b')
end

return M

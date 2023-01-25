local M = {}

M.config = function()
  local cmd = vim.cmd
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

  -- gruvbox-material
--  vim.g.gruvbox_material_background = 'medium'
--  vim.g.gruvbox_material_visual = 'reverse'
--  cmd('colorscheme gruvbox-material')
--  cmd('highlight CursorLine guibg=#3f3d3b')
--  cmd('highlight LineNr guifg=#5b5b5b')
--  cmd('highlight CursorLineNr guifg=orange')
  -- 
  -- everforest
  -- vim.g.everforest_background = 'medium'
  -- cmd('colorscheme everforest')
  -- cmd('highlight CursorLine guibg=#3f3d3b')
  -- cmd('highlight LineNr guifg=#5b5b5b')
  -- cmd('highlight CursorLineNr guifg=orange')

  -- tokyo night
  cmd('colorscheme tokyonight-moon')
  cmd('highlight CursorLineNr guifg=orange')
  cmd('highlight CursorLine guibg=#3f3d3b')
  cmd('highlight LineNr guifg=#5b5b5b')
end

return M

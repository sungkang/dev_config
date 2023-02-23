return {
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  },
  {
    'catppuccin/nvim',
    name = "catppuccin",
    enabled = false,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
      vim.cmd('highlight CursorLineNr guifg=orange')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
    end
  },
  {
    'sainnhe/gruvbox-material',
    enabled = true,
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_visual = 'reverse'
      vim.cmd('colorscheme gruvbox-material')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end
  },
  {
    'sainnhe/everforest',
    enabled = false,
    config = function()
      vim.g.everforest_background = 'medium'
      vim.cmd('colorscheme everforest')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end
  },

}

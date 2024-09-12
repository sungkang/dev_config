return {
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  },
  {
    'catppuccin/nvim',
    name = "catppuccin",
    enabled = true,
    config = function ()
      require('catppuccin').setup({
        flavor = 'mocha',
      })

      vim.cmd('colorscheme catppuccin')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
      vim.cmd('highlight Visual guibg=#8f617a')
    end
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
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

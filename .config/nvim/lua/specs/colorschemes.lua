return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    -- enabled = false,
    priority = 2000,
    config = function()
      vim.cmd('colorscheme kanagawa')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end,
  },

  {
    'catppuccin/nvim',
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme catppuccin')
    end
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_visual = 'reverse'
      vim.cmd('colorscheme gruvbox-material')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end,
  },

  {
    'sainnhe/everforest',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'medium'
      vim.cmd('colorscheme everforest')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end,
  },

  {
    'sungkang/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = { styles = { floats = "light", popups = "light", } },
    config = function(plugin, options)
      require(plugin.name).setup(options)
      vim.cmd('colorscheme tokyonight-moon')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end,
  },
}

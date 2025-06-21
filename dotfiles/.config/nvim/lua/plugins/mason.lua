return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup {}
      require('mason-lspconfig').setup {
        automatic_installation = true,
        automatic_enable = false,
      }
    end
  },
}

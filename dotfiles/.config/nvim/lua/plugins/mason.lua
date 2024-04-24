return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local servers = {
        "volar@1.8.27"
      }
      require('mason').setup {}
      require('mason-lspconfig').setup {
        ensure_installed = servers,
        automatic_installation = true,
      }
    end
  },
}

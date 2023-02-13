return {
  'vimwiki/vimwiki',
  config = function()
    vim.g.vimwiki_folding = 'expr'
    vim.g.vimwiki_list = {
      {
        path = '~/.local/share/vimwiki/purina_just_right',
        syntax = 'markdown',
        ext = '.md',
      },
      {
        path = '~/.local/share/vimwiki/personal',
        syntax = 'markdown',
        ext = '.md',
      },
    }
  end
}

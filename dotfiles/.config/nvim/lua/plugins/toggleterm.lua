function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', [[<C-\>]], [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-q>', [[<Cmd>wincmd q<CR>]], opts)
  vim.keymap.set('t', '<C-\\><C-\\>', [[<Cmd>wincmd q<CR>]], opts)
end

return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        shell = '/usr/local/bin/fish',
        open_mapping = [[<c-\>]],
        size = 20,
        terminal_mappings = false,
      })

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = 'lazygit',
        dir = 'git_dir',
        hidden = true,
        direction = 'float',
        env = {
          GIT_EDITOR = [[nvr -cc vsplit +'set bufhidden=wipe']],
        },
        on_open = function(term)
          vim.cmd('startinsert!')
          vim.keymap.set('t', ',g', [[<Cmd>wincmd q<CR>]], { buffer = term.bufnr })
        end,
        on_close = function()
        end,
        count = 99,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
    end
  },
}

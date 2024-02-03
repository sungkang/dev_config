local M = {}

M.config = function()
  local set  = vim.keymap.set
  local opts = { noremap = true, silent = true }


  require('toggleterm').setup({
    shading_factor = '-30',
  })

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function()
      vim.cmd("startinsert!")
    end,
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  set('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', opts)
end

return M

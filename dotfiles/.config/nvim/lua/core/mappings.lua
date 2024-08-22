local M = {}

function M.config()
  local set = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- lazy.nvim
  set('n', '<leader>l', '<Cmd>Lazy<CR>', opts)

  -----------------
  -- misc mappings
  -----------------
  set('n', '<leader>ev', '<Cmd>vsplit $MYVIMRC<CR>', opts)
  set('n', '<leader>vv', '<Cmd>source $MYVIMRC<CR>', opts)
  set('n', '<leader>/', '<Cmd>noh<CR>', opts)
  set('n', '<leader>q', '<Cmd>q<CR>', opts)
  set('n', '<leader>Q', '<Cmd>q!<CR>', opts)
  set('n', '<leader>w', '<Cmd>w<CR>', opts)
  set('n', '<leader>ee', '<Cmd>e<CR>', opts)
  set('n', 'U', '<c-r>', opts)
  set('n', '<space>lf', '<Cmd>!eslint_d --fix %<CR>', opts)

  -- jump to normal mode in terminal
  set('t', '<c-\\><c-\\>', '<c-\\><c-n>', opts)

  -------------------------
  -- navigation and search
  -------------------------
  set('n', '<c-f>', '<Cmd>silent !tmux neww tmux-sessionizer<CR>', opts)
  set('n', 'L', 'Lzz', opts)
  set('n', 'H', 'Hzz', opts)
  set('n', '<leader>,', ',', opts)

  ---------------------
  -- window management
  ---------------------
  set('n', '<c-h>', '<c-w>h', opts)
  set('n', '<c-j>', '<c-w>j', opts)
  set('n', '<c-k>', '<c-w>k', opts)
  set('n', '<c-l>', '<c-w>l', opts)

  ------------
  -- quickfix
  ------------
  set('n', '<leader>cc', '<Cmd>copen<CR><c-w>J', opts)
  set('n', '<leader>cl', '<Cmd>cclose<CR>', opts)
  set('n', '[q', '<Cmd>cp<CR>zz', opts)
  set('n', ']q', '<Cmd>cn<CR>zz', opts)

  ------------------
  -- tab management
  ------------------
  set('n', '<leader>tn', '<Cmd>tabnew<CR>', opts)
  set('n', '<leader>tc', '<Cmd>tabclose<CR>', opts)
  set('n', '[t', '<Cmd>tabp<CR>', opts)
  set('n', ']t', '<Cmd>tabn<CR>', opts)

  ----------
  -- splits
  ----------
  set('n', 'ss', '<Cmd>split<CR><c-w>w', opts)
  set('n', 'vs', '<Cmd>vsplit<CR><c-w>w', opts)
  -- resize splits
  -- (vertical)
  set('n', '<m-h>', '5<c-w><', opts)
  set('n', '<m-l>', '5<c-w>>', opts)
  -- (horizontal)
  set('n', '<m-j>', '5<c-w>-', opts)
  set('n', '<m-k>', '5<c-w>+', opts)

  -----------
  -- buffers
  -----------
  set('n', '<c-n>', '<c-^>', opts)
  set('n', '<leader>BB', '<Cmd>bd<CR>', opts)
  set('n', '<leader>BA', '<Cmd>%bd<CR>', opts)

  -----------
  -- diffing
  -----------
  set('n', '<leader>dfa', '<Cmd>windo diffthis<CR>', opts)
  set('n', '<leader>dfo', '<Cmd>windo diffoff<CR>', opts)

  ------------
  -- fugitive
  ------------
  set('n', '<space>gst', '<Cmd>G<CR>', opts)
  set('n', '<space>ga', '<Cmd>G blame<CR>', opts)
  set('n', '<space>gl', '<Cmd>G log --graph<CR>', opts)
  set('n', '<space>gla', '<Cmd>G log --graph --decorate --all<CR>', opts)

  --------------
  -- formatting
  --------------
  -- wk.register({
  --     F = {
  --         name = "filetype",
  --         j = { "<Cmd>set filetype=json foldmethod=indent<CR>", "JSON" },
  --     },
  -- }, { prefix = '<leader>'})
  set('n', '<leader>jf', "<Cmd>'<,'>!python3 -m json.tool<CR>", opts)
  set('v', '<leader>jf', "<Cmd>'<,'>!python3 -m json.tool<CR>", opts)

  -----------
  -- folding
  -----------
  set('n', 'z<CR>', "zr", opts)
  set('n', 'z<bs>', "zm", opts)

  -----------
  -- testing
  -----------
  -- set('n', '<space>rt', '<Cmd>TestNearest<CR>', opts)
  -- set('n', '<space>rf', '<Cmd>TestFile<CR>', opts)
  -- set('n', '<space>ra', '<Cmd>TestSuite<CR>', opts)
  -- set('n', '<space>rr', '<Cmd>TestLast<CR>', opts)
  -- set('n', '<space>g', '<Cmd>TestVisit<CR>', opts)

  -------------
  -- gitgutter
  -------------
  set('n', '<space>hp', '<Cmd>GitGutterPreviewHunk<CR>')
  set('n', '<space>hs', '<Cmd>GitGutterStageHunk<CR>')
  set('n', '<space>hu', '<Cmd>GitGutterUndoHunk<CR>')

  ------------------
  -- timestamp line
  ------------------
  set('n', '<leader>T', "<Cmd>pu=strftime('%c')<CR>kJ", opts)

  ----------------
  -- inlay hints
  ----------------
  set('n', '<leader>ih', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
end

return M

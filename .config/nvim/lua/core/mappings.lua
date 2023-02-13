local M = {}

function M.config()
  local set = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- local wk = require('which-key')

  -- lazy.nvim
	set('n', '<leader>l', ':Lazy<cr>', opts)

  -- general mappings
	set('n', '<C-U>', '<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>M', opts)
	set('n', '<C-D>', '<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>M', opts)
  set('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', opts)
  set('n', '<leader>vv', ':source $MYVIMRC<cr>', opts)
  set('n', '<leader>/', ':noh<cr>', opts)
  set('n', '<leader>q', ':q<cr>', opts)
  set('n', '<leader>Q', ':q!<cr>', opts)
  set('n', '<leader>w', ':w<cr>', opts)
  set('n', '<leader>ee', ':e<cr>', opts)
  set('n', 'U', '<c-r>', opts)

  -- jump to normal mode in terminal
  set('t', '<c-\\><c-\\>', '<c-\\><c-n>', opts)

  -- navigation and search
  set('n', 'L', 'Lzz', opts)
  set('n', 'H', 'Hzz', opts)
  set('n', '<leader>,', ',', opts)

  -- window management
  set('n', '<c-h>', '<c-w>h', opts)
  set('n', '<c-j>', '<c-w>j', opts)
  set('n', '<c-k>', '<c-w>k', opts)
  set('n', '<c-l>', '<c-w>l', opts)

  -- quickfix
  set('n', '[q', ':cp<cr>zz', opts)
  set('n', ']q', ':cn<cr>zz', opts)

  -- tab management
  set('n', '<leader>tn', ':tabnew<cr>', opts)
  set('n', '<leader>tc', ':tabclose<cr>', opts)
  set('n', '[t', ':tabp<cr>', opts)
  set('n', ']t', ':tabn<cr>', opts)

  -- splits
  set('n', 'ss', ':split<cr><c-w>w', opts)
  set('n', 'vs', ':vsplit<cr><c-w>w', opts)

  -- resize splits
  -- (vertical)
  set('n', '_', '5<c-w><', opts)
  set('n', '+', '5<c-w>>', opts)
  -- (horizontal)
  set('n', '<c-w><c-_>', '5<c-w>-', opts)
  set('n', '<c-w><c-=>', '5<c-w>+', opts)

  -- buffers
  set('n', '<c-f>', '<c-^>', opts)
  set('n', '<c-b>', '<c-^>', opts)
  set('n', '<leader>BB', ':bd<cr>', opts)
  set('n', '<leader>BA', ':%bd<cr>', opts)
  set('n', '<space>a', '<cmd>lua require("harpoon.mark").add_file()<cr>', opts)

  -- mappings: diff
  set('n', '<leader>dfa', ':windo diffthis<cr>', opts)
  set('n', '<leader>dfo', ':windo diffoff<cr>', opts)

  -- formatting
  -- formatting: JSON
  set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
  set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

  -- folding
  set('n', 'z<cr>', "zr", opts)
  set('n', 'z<bs>', "zm", opts)

  -- testing
  set('n', '<space>rt', ':TestNearest<cr>', opts)
  set('n', '<space>rf', ':TestFile<cr>', opts)
  set('n', '<space>ra', ':TestSuite<cr>', opts)
  set('n', '<space>rr', ':TestLast<cr>', opts)
  -- set('n', '<space>g', ':TestVisit<cr>', opts)

  -- timestamp line
  set('n', '<leader>T', ":pu=strftime('%c')<cr>kJ", opts)
end

return M

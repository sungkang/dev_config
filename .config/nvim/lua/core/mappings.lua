local M = {}

function M.config()
  local set = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- local wk = require('which-key')

  -- general mappings
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
  set('n', '<leader>tt', ':tabnew<cr>', opts)
  set('n', '<leader>te', ':tabclose<cr>', opts)
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

  -- nvim-tree
  set('n', '<leader>n', ':NvimTreeToggle<cr>', opts)
  set('n', '<leader>r', ':NvimTreeFindFile<cr>', opts)

  -- mappings: diff
  set('n', '<leader>dfa', ':windo diffthis<cr>', opts)
  set('n', '<leader>dfo', ':windo diffoff<cr>', opts)

  -- fugitive
  set('n', '<space>gst', ':G<cr>', opts)
  set('n', '<space>ga', ':G blame<cr>', opts)
  set('n', '<space>gl', ':G log --graph<cr>', opts)
  set('n', '<space>gla', ':G log --graph --decorate --all<cr>', opts)

  -- trouble
  set('n', '<leader>xx', ':TroubleToggle<cr>', opts)
  set('n', '<leader>xw', ':Trouble workspace_diagnostics<cr>', opts)
  set('n', '<leader>xd', ':Trouble document_diagnostics<cr>', opts)

  -- formatting
  -- wk.register({
  --     F = {
  --         name = "filetype",
  --         j = { "<cmd>set filetype=json foldmethod=indent<cr>", "JSON" },
  --     },
  -- }, { prefix = '<leader>'})
  set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
  set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

  -- testing
  set('n', '<space>t', ':TestNearest<cr>', opts)
  set('n', '<space>T', ':TestFile<cr>', opts)
  set('n', '<space>a', ':TestSuite<cr>', opts)
  set('n', '<space>l', ':TestLast<cr>', opts)
  -- set('n', '<space>g', ':TestVisit<cr>', opts)

  -- timestamp line
  set('n', '<leader>T', ":pu=strftime('%c')<cr>kJ", opts)
end

return M

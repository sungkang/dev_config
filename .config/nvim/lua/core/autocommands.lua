M = {}

M.autocommands = {
  -- telescope-nvim has a folding bug for newly opened buffers where folds are not recognized, this fixes it in the meantime.
  -- remove this once the bug is fixed.
  _nvim_telescope_fold_workaround = {
    { 'BufRead', '*', 'autocmd BufWinEnter * ++once normal! zx zR'},
  },
  _help = {
    -- Open split vertically on the right
    { 'BufEnter', '*.txt', "if &buftype == 'help' | wincmd L | endif" },
  }
}

function M.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
      vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

M.config = function()
  M.define_augroups(M.autocommands)
end

return M

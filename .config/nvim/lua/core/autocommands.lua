M = {}

M.config = function()
  vim.cmd([[
    augroup _nvim_telescope_fold_workaround
      autocmd!
      autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
    augroup END

    augroup _help
      autocmd!
      autocmd BufEnter * if &buftype == 'help' && winwidth(0) == &columns | wincmd L | endif
    augroup END
  ]])
    -- Notes: _help
    -- When opening the help buffer, upon open, set the buffer to the right most vertical split.
    -- The winwidth() check is to determine whether a help buffer is already open, if so, do not issue the wincmd.
    -- The reason for this is because telescope.nvim issues a close window command when closing the prompt buffer and when
    -- the BufEnter event is triggered which then tries to issue the wincmd, you will get an error stating that a split
    -- cannot be issued while a window is closing.
end

return M

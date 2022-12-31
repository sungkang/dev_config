M = {}

M.config = function()
  vim.cmd([[
    augroup _nvim_telescope_fold_workaround
      autocmd!
      autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
    augroup END

    augroup _help
      autocmd!
      autocmd BufEnter *.txt if &buftype == 'help' && winwidth(0) == &columns | wincmd L | endif
    augroup END
  ]])
end

return M

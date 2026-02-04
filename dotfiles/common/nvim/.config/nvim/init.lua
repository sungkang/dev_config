-----------------------
-- bootstrap lazy.nvim
-----------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
vim.opt.rtp:prepend(lazypath)

--------------
-- leader key
--------------
vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()

-----------
-- plugins
-----------
require("lazy").setup({ import = "plugins" }, {
  change_detection = {
    notify = false,
  }
})

-- loading internal plugins
vim.cmd.packadd("cfilter")

---------------
-- code fences
---------------
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

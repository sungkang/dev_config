local M = {}

M.config = function()
  vim.v['test#strategy'] = 'neovim'
  require('nvim-test').setup({})

  -- CAC go test config
  require('nvim-test.runners.go-test'):setup {
    env = {
      CYBETA_ROOT = 'https://api.dev.intelink.cybeta.com/wsapi',
      CYBETA_CLIENT = 'cacs',
    },
  }


  -- JavaScript/TypeScript
  require('nvim-test.runners.jest'):setup {
    command = "node", -- a command to run the test runner
    args = { "node_modules/jest/bin/jest.js", "--collectCoverage=false"}, -- default arguments
    env = { CUSTOM_VAR = 'value' }, -- custom environment variables

    file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
    find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

    filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
    working_directory = nil, -- set working directory (cwd by default)
  }

end

return M

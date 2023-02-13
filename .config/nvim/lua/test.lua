local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

function test()
    vim.treesitter.require_language("javascript", "/Users/skang/.config/nvim/plugged/nvim-treesitter/parser/javascript.so")
    local parser = vim.treesitter.get_parser(0)
    local tstree = parser:parse()
    local startRow = tstree[1]:root():child(0):start()
    local endRow = tstree[1]:root():child(0):end_()
    print(startRow, endRow)
    local text = vim.api.nvim_buf_get_lines(0, startRow, endRow+1, true)
    -- local text = vim.api.nvim_buf_get_lines(0, 1, 8, true)

    for child in tstree[1]:root():iter_children() do
        local startRow = child:start()
        local endRow = child:end_()
        local lines = vim.api.nvim_buf_get_lines(0, startRow, endRow+1, true)
        print(lines[1], child:child_count())

        for grandchild in child:iter_children() do
            print(grandchild:type())
        end
    end

    -- print(type(tstree[1]:root():child(0):start()))
    -- print(type(tstree[1]:root():child(0):end_()))
end

set('n', '<leader>tt', ':lua test()<cr>', opts)
set('n', '<leader>st', ':so ~/.config/nvim/lua/test.lua<cr>', opts)

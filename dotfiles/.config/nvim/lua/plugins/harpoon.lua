return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local set = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local harpoon = require('harpoon')
    harpoon.setup {}

    local conf = require('telescope.config').values

    local function make_finder(file_paths)
      return require('telescope.finders').new_table({
        results = file_paths,
        reset_prompt = true,
        path_display = { 'truncate' },
      })
    end

    local function list_indexOf(list, predicate)
      for i, v in ipairs(list) do
        if predicate(v) then
          return i
        end
      end
      return -1
    end

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = make_finder(file_paths),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        path_display = { 'truncate' },
        initial_mode = 'normal',
        attach_mappings = function(_, map)
          map('i', '<c-d>', function(prompt_bufnr)
            local state = require('telescope.actions.state')
            local curr_picker = state.get_current_picker(prompt_bufnr)
            curr_picker:delete_selection(function(selection)
              local mark_idx = list_indexOf(harpoon_files.items, function(v)
                return v.value == selection[1]
              end)
              if mark_idx == -1 then
                return
              end

              harpoon:list():remove_at(mark_idx)
            end)
          end, opts)

          map('n', 'dd', function(prompt_bufnr)
            local state = require('telescope.actions.state')
            local curr_picker = state.get_current_picker(prompt_bufnr)
            curr_picker:delete_selection(function(selection)
              local mark_idx = list_indexOf(harpoon_files.items, function(v)
                return v.value == selection[1]
              end)
              if mark_idx == -1 then
                return
              end

              harpoon:list():remove_at(mark_idx)
            end)
          end, opts)

          return true
        end,
      }):find()
    end

    set('n', '<space>m', function() toggle_telescope(harpoon:list()) end, opts)
    set('n', '<Space>a', function() harpoon:list():add() end, opts)
    set("n", "<C-S-P>", function() harpoon:list():prev() end, opts)
    set("n", "<C-S-N>", function() harpoon:list():next() end, opts)
  end,
}

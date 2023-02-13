function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- mappings
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>'
  , opts)
set('n', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
set('v', '<c-p>', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').find_files({ default_text = text })
end, opts)
set('n', '<leader>f', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
set('v', '<leader>f', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').live_grep({ default_text = text })
end, opts)
-- set('n', '<leader>g', '<cmd>lua require("plugins.telescope").changed_on_branch()<cr>', opts)
set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
set('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
set('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
set('n', '<leader>k', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts)
set('n', '<space>m', '<cmd>Telescope harpoon marks initial_mode=normal<cr>', opts)
-- set('n', '<space>m', '<cmd>Telescope harpoon marks<cr>', opts)
--
return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  opts = {
    defaults = {
      layout_strategy = 'horizontal',
      path_display = { 'truncate' },
      layout_config = {
        prompt_position = 'top',
        height = 0.7,
      },
      sorting_strategy = 'ascending',
      mappings = {
        n = {
          ["o"] = "select_default",
          ["q"] = "close",
          ["t"] = require('trouble.providers.telescope').open_with_trouble,
        },
      }
    },
    pickers = {
      live_grep = {
        mappings = {
          n = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          },
          i = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          }
        },
      },
      find_files = {
        hidden = true,
        mappings = {
          n = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          },
          i = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          }
        },
      },
      buffers = {
        mappings = {
          n = {
            ["dd"] = "delete_buffer",
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          },
          i = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          }
        },
        sort_mru = true,
        initial_mode = "normal",
      },
      lsp_definitions = {
        initial_mode = "normal",
        show_line = false,
      },
      lsp_references = {
        show_line = false,
        initial_mode = "normal",
        ignore_filename = true,
      },
      quickfix = {
        initial_mode = "normal",
      },
    },
    extensions = {
      -- the plugin currently doesn't support this
      harpoon = {
        initial_mode = "normal",
        path_display = { 'truncate' },
        mappings = {
          n = {
            ["dd"] = "delete_buffer",
          },
        },
      },
    },
  },
}

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'folke/trouble.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    config = function()
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }
      local trouble = require('trouble.sources.telescope')
      local lga_actions = require('telescope-live-grep-args.actions')
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      require('telescope').setup({
        defaults = {
          layout_strategy = 'horizontal',
          file_ignore_patterns = { 'node_modules', '.git' },
          -- wrap_results = true,
          path_display = { 'filename_first' },
          layout_config = {
            prompt_position = 'top',
            height = 0.7,
          },
          sorting_strategy = 'ascending',
          mappings = {
            n = {
              ["o"] = "select_default",
              ["q"] = "close",
              ["t"] = trouble.open,
            },
          }
        },
        pickers = {
          live_grep = {
            hidden = true,
            no_ignore = true,
            additional_args = { "--follow" },
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
          lsp_document_symbols = {
            symbol_width = 50,
            symbols = { "class", "method", "function", "variable", "interface" },
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            additional_args = { "--follow" },
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            }
          },
        },
      })

      local function getVisualSelection()
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

      local function open_file_or_dir_in_oil(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        -- Be defensive about where the path lives in the entry
        local path = entry.path or entry.filename or entry.value or entry[1]
        if not path then return end

        -- If it's a directory -> open in Oil, else edit file
        if vim.fn.isdirectory(path) == 1 then
          vim.cmd("Oil " .. vim.fn.fnameescape(path))
        else
          vim.cmd("edit " .. vim.fn.fnameescape(path))
        end
      end

      -- One picker to show BOTH files and directories
      local function find_anything(options)
        options = options or {}
        require("telescope.builtin").find_files(vim.tbl_extend("force", {
          prompt_title = "Files & Folders",
          -- fd returns files and dirs when no --type is given
          -- --hidden to include dotfiles, exclude .git for signal/noise
          find_command = { "fd", "--hidden", "--no-ignore", "--follow", "--exclude", ".git", "--strip-cwd-prefix" },
          -- Let us intercept <CR>
          attach_mappings = function(_, map)
            map({ "i", "n" }, "<CR>", open_file_or_dir_in_oil)

            -- Optional: open the *containing* directory in Oil with <C-o>
            map({ "i", "n" }, "<C-o>", function(pb)
              local e = action_state.get_selected_entry()
              local p = (e and (e.path or e.filename or e.value or e[1])) or nil
              if not p then return end
              local dir = vim.fn.isdirectory(p) == 1 and p or vim.fn.fnamemodify(p, ":h")
              actions.close(pb)
              vim.cmd("Oil " .. vim.fn.fnameescape(dir))
            end)

            return true
          end,
        }, options))
      end

      -- extensions
      require('telescope').load_extension('live_grep_args')

      -- mappings
      set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)
      set("n", "<c-p>", find_anything,
        vim.tbl_extend("force", opts, { desc = "Find file/folder → open (Oil.nvim for dirs)" }))
      set('v', '<c-p>', function()
        find_anything({ default_text = getVisualSelection() })
      end, vim.tbl_extend("force", opts, { desc = "Find file/folder → open (Oil.nvim for dirs)" }))
      set('n', '<leader>f', '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', opts)
      set('v', '<leader>f', function()
        require('telescope.builtin').live_grep({ default_text = getVisualSelection() })
      end, opts)
      set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
      set('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
      set('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
      set('n', '<leader>k', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts)
    end
  },
}

local is_npm_package_installed = require("utils").is_npm_package_installed

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp_config = require("lspconfig")
      local bset = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }

      vim.diagnostic.config({ virtual_text = true })

      -- configure default on_attach callback function
      local on_attach = function(client, bufnr)
        bset(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        bset(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ border = 'rounded'})<cr>", opts)
        bset(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        bset(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        bset(bufnr, "n", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        bset(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
        bset(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
        bset(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
        bset(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        bset(bufnr, "n", "<space>c", "<cmd>lua vim.lsp.buf.code_action({border = 'rounded'})<cr>", opts)
        -- bset(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        -- bset(bufnr, "v", "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        bset(bufnr, "n", "<space>e", "<cmd>lua vim.diagnostic.open_float({border = 'rounded'})<cr>", opts)
        bset(bufnr, "n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
        bset(bufnr, "n", "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
        bset(bufnr, "n", "<space>ll", "<cmd>LspRestart<cr>", opts)
        -- require("illuminate").on_attach(client)
      end

      -- update capabilities with completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- choose default formatters for certain lsps
      local on_attach_with_disabled_lsp_formatter = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
      end

      local servers = {
        "vue_ls",
        "vtsls",
        "svelte",
        "lua_ls",
        "gopls",
        "cssls",
        "gdscript",
        "pyright",
        "ruff",
        "tailwindcss",
        "clangd",
        "zls",
        "templ",
      }
      for _, lsp in pairs(servers) do
        local config = {
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150,
          },
          capabilities = capabilities,
        }

        if lsp == "tailwindcss" then
          config.settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cn\\(([^)]*)\\)",  "[\"'`]([^\"'`]*)[\"'`]" },
                },
              },
            },
          }
        end

        if lsp == "svelte" then
          config.on_attach = on_attach_with_disabled_lsp_formatter
        end

        if lsp == "vtsls" then
          if is_npm_package_installed("vue") then
            config.settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = {
                    {
                      name = '@vue/typescript-plugin',
                      location = vim.fn.stdpath('data') ..
                          "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                      languages = { 'typescript', 'javascript', 'vue' },
                      configNamespace = 'typescript',
                    }
                  },
                },
              },
            }

          end
            config.filetypes = { "typescript", "javascript", "vue" }
            config.on_attach = on_attach_with_disabled_lsp_formatter
        end

        if lsp == "vue_ls" then
          config.on_attach = on_attach_with_disabled_lsp_formatter
        end

        if lsp == "lua_ls" then
          config.settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.list_extend(
                  vim.api.nvim_get_runtime_file("", true),
                  { vim.fn.expand("~/.config/yazi/plugins/types.yazi") }
                ),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          }
        end

        if lsp == "cssls" then
          config.settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              }
            }
          }
        end

        vim.lsp.config(lsp, config)
        vim.lsp.enable(lsp)
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    enabled = true,
    config = function()
      require("null-ls").setup({
        sources = {
          require("none-ls.diagnostics.eslint_d"),
        },
      })
    end,
  },
}

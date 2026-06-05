local servers = {
  "bashls",
  "cssls",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "taplo",
  "ts_ls",
  "yamlls",
}

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.diagnostic.config({
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
        virtual_text = {
          spacing = 2,
          source = "if_many",
        },
      })

      local diagnostic_float_win

      local function open_line_diagnostic(focus)
        if diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
          vim.api.nvim_win_close(diagnostic_float_win, true)
        end

        local _, win = vim.diagnostic.open_float({
          focus = focus,
          focusable = true,
          scope = "line",
        })

        diagnostic_float_win = win

        if focus and diagnostic_float_win then
          vim.api.nvim_set_current_win(win)
        end
      end

      local function jump_diagnostic(count)
        vim.diagnostic.jump({ count = count })
        vim.schedule(function()
          open_line_diagnostic(false)
        end)
      end

      vim.keymap.set("n", "[d", function()
        jump_diagnostic(-1)
      end, { desc = "Previous diagnostic" })

      vim.keymap.set("n", "]d", function()
        jump_diagnostic(1)
      end, { desc = "Next diagnostic" })

      vim.keymap.set("n", "<leader>d", function()
        open_line_diagnostic(true)
      end, { desc = "Show line diagnostic" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("sean-lsp-attach", { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Goto definition" })
        end,
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            check = {
              command = "clippy",
            },
          },
        },
      })

      vim.lsp.config("marksman", {
        filetypes = { "markdown" },
      })

      vim.lsp.config("ts_ls", {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
      })

      vim.lsp.config("yamlls", {
        filetypes = { "yaml" },
      })

      vim.lsp.enable(servers)
    end,
  },
}

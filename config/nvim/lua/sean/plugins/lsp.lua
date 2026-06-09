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
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.lsp.log.set_level(vim.log.levels.ERROR)

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

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "Previous diagnostic" })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "Next diagnostic" })

      vim.keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float({ scope = "line" })
      end, { desc = "Show line diagnostic" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("sean-lsp-attach", { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Goto definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Goto declaration" })
          vim.keymap.set("n", "gn", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
          vim.keymap.set({ "n", "x" }, "ga", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Goto code action" })

          local telescope = require("telescope.builtin")
          vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = event.buf, desc = "Goto references" })
          vim.keymap.set("n", "gi", telescope.lsp_implementations, { buffer = event.buf, desc = "Goto implementation" })
          vim.keymap.set("n", "gt", telescope.lsp_type_definitions, { buffer = event.buf, desc = "Goto type definition" })
          vim.keymap.set("n", "gO", telescope.lsp_document_symbols, { buffer = event.buf, desc = "Document symbols" })
          vim.keymap.set("n", "gW", telescope.lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = "Workspace symbols" })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            vim.keymap.set("n", "<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
            end, { buffer = event.buf, desc = "Toggle inlay hints" })
          end
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

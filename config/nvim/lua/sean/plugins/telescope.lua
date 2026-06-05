return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local vimgrep_arguments = vim.deepcopy(require("telescope.config").values.vimgrep_arguments)

      vim.list_extend(vimgrep_arguments, {
        "--hidden",
        "--glob",
        "!**/.git/*",
      })

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
          file_ignore_patterns = { "%.git/" },
        },
        pickers = {
          find_files = { hidden = true },
        },
        extensions = {
          ["ui-select"] = themes.get_dropdown(),
        },
      })

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string" })
    end,
  },
}

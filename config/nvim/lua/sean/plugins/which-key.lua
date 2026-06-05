return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 200,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "<C-...> ",
        M = "<M-...> ",
        D = "<D-...> ",
        S = "<S-...> ",
        CR = "<CR> ",
        Esc = "<Esc> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
      },
    },
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Split" },
    },
  },
}

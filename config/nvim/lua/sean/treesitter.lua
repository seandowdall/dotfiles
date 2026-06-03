vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "lua", "markdown", "query", "vim", "vimdoc" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

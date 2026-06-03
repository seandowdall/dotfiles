local map = vim.keymap.set

map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })

map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontally" })
map("n", "<leader>se", "<c-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

map("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
map("n", "<c-j>", "<c-w>j", { desc = "Move to lower window" })
map("n", "<c-k>", "<c-w>k", { desc = "Move to upper window" })
map("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })

map("n", "<left>", '<cmd>echo "Use h to move!!"<cr>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<cr>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<cr>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<cr>')

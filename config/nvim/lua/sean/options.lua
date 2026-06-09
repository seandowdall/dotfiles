vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true

opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.undofile = true

vim.opt.formatoptions:remove({ "c", "r", "o" })

vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.confirm = true

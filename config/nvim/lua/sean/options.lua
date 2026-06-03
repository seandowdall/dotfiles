vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

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

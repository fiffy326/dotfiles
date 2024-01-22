vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.opt.shortmess = "I"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undodir"

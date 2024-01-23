-- Must be set before plugins are loaded!
vim.g.mapleader = " "

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Indents
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- No line wrap
vim.opt.wrap = false

-- Space left at top/bottom when scrolling
vim.opt.scrolloff = 4

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show guide at column 80
vim.opt.colorcolumn = "80"

-- Always enable left column
vim.opt.signcolumn = "yes"

-- Ignore case in searches
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight searches interactively
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Highlight text on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Use undo instead of swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undodir"

-- Use fancy colors
vim.opt.termguicolors = true

-- Always use block cursor
vim.opt.guicursor = ""

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable autocomplete menu
vim.opt.completeopt = "menuone,noselect"

-- Disable intro screen
vim.opt.shortmess = "I"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

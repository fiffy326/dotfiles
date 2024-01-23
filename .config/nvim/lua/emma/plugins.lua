-- Plugin list
local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "mbbill/undotree"
    },
    {
        "tpope/vim-sleuth"
    },
    {
        "folke/neodev.nvim",
        opts = {}
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        "hrsh7th/nvim-cmp"
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "hrsh7th/cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-buffer"
    },
    {
        "hrsh7th/cmp-path"
    },
    {
        "saadparwaiz1/cmp_luasnip"
    },
    {
        "L3MON4D3/LuaSnip"
    },
    {
        "rafamadriz/friendly-snippets"
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x"
    }
}

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup(plugins)

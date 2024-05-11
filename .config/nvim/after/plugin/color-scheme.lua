local default_color_scheme = "catppuccin"

require("catppuccin").setup({
    transparent_background = true
})

function set_color_scheme(color_scheme)
    require(color_scheme or default_color_scheme)
    vim.cmd.colorscheme(color_scheme or default_color_scheme)

    -- Force transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

set_color_scheme()


local options = {
    dim_inactive = true,
}

local palettes = {
    carbonfox = {
        sel0 = "#3a3838",
    },
}

require("nightfox").setup({ options = options, palettes = palettes })

vim.cmd("colorscheme carbonfox")

-- return the specs
return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        require("onedarkpro").setup({
            themes = {
                pywal = "~/.config/nvim/lua/plugins/colors/pywal.lua",
            },
            styles = {
                constants = "bold",
            },
        })
        vim.cmd("OneDarkProClean")
        vim.cmd("OneDarkProCache")
        vim.cmd([[colorscheme pywal]])
    end,
}

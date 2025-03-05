return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    lazy = false,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
}

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ setting options ]]
require("options")

-- [[ basic keymaps ]]
require("keymaps")

-- [[ commands ]]
require("commands")

-- [[ install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ configure and install plugins ]]
require("lazy-plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

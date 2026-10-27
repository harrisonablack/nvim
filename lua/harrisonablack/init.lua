vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require "harrisonablack.options"
require "harrisonablack.keymaps"
require "harrisonablack.plugins"

-- After the colorscheme is applied so highlight groups resolve correctly.
require "harrisonablack.statusline"

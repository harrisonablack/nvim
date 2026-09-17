local o, g = vim.opt, vim.g

g.mapleader = " "
g.have_nerd_font = true
o.number = true
o.relativenumber = true
o.winborder = "rounded"
o.smartindent = true
o.termguicolors = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.laststatus = 3
o.softtabstop = 2
o.tabstop = 2
o.shiftwidth = 2
o.cursorcolumn = false
o.ignorecase = true
o.conceallevel = 2
o.cmdheight = 0
vim.diagnostic.config {
  virtual_text = true,
}

require("vim._core.ui2").enable()

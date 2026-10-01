local o = vim.opt

vim.g.have_nerd_font = true
o.number = true
o.relativenumber = true
o.winborder = "rounded"
o.termguicolors = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.laststatus = 3
o.softtabstop = 2
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.shiftround = true
o.smartindent = false
vim.cmd "filetype plugin indent on"
o.cursorcolumn = false
o.ignorecase = true
o.smartcase = true
o.conceallevel = 2
o.cmdheight = 0
o.undofile = true
o.splitbelow = true
o.splitright = true
o.confirm = true
o.updatetime = 250
o.timeoutlen = 400
o.scrolloff = 5
o.sidescrolloff = 5

vim.diagnostic.config {
  severity_sort = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, source = "if_many" },
  float = { border = "rounded", source = "if_many" },
}

-- UI2 is private and may move or change between nightly builds.
pcall(function()
  require("vim._core.ui2").enable()
end)

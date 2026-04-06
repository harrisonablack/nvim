vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 0
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.conceallevel = 2
vim.o.cmdheight = 0
vim.diagnostic.config({
	virtual_text = true,
})

require('vim._core.ui2').enable()

vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    local value = ev.data.params.value
    vim.api.nvim_echo({ { value.message or 'done' } }, false, {
      id = 'lsp.' .. ev.data.client_id,
      kind = 'progress',
      source = 'vim.lsp',
      title = value.title,
      status = value.kind ~= 'end' and 'running' or 'success',
      percent = value.percentage,
    })
  end,
})

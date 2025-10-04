vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':wqa<CR>')
map('n', '<C-F>', '<CMD>Open .<CR>')
map('n', '<leader>s', ':e #<CR>')

-- Language format
map('n', '<leader>lf', vim.lsp.buf.format)

-- Map ; to : to avoid shift-; constantly
map({'n', 'v', 'x'}, ';', ':')
map({'n', 'v', 'x'}, ':', ';')

-- Mini pick Buffers, Files and grep
map('n', '<leader>g', '<Cmd>Pick grep_live<CR>')
map('n', '<leader>r', '<Cmd>Pick buffers<CR>')
map('n', '<leader>f', '<Cmd>Pick files<CR>')

-- Oil files
map('n', '<leader>e', '<Cmd>Oil<CR>')
map('n', '<leader>E', require("oil").open_float)

-- Open lazygit in nvim
map('n', '<leader>lg', '<Cmd>LazyGit<CR>')

-- Buff delete / buff previous
map("n", "<leader>bd", require("mini.bufremove").delete, opts)
map("n", "<leader>bp", ':bp<CR>')

-- Diagnostics
map("n", "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<cr>")

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")

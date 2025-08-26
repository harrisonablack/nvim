vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>F', vim.lsp.buf.format)

map('n', '-', ':Oil<CR>')
map('n', '<leader>f', ':Pick files <CR>')

map("n", ",", "<Cmd>BufferPrevious<CR>", opts)
map("n", ".", "<Cmd>BufferNext<CR>", opts)
map("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)

map("n", "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<cr>")

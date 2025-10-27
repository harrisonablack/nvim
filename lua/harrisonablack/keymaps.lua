vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':wqa<CR>', opts)
map('n', '<leader>s', ':e #<CR>', opts)
map('n', '<leader>bd', require("mini.bufremove").delete, opts)
map('n', '<leader>bp', ':bp<CR>', opts)
map('n', '<leader>v', ':vsplit<CR>', opts)

map('n', '<C-F>', '<Cmd>Open .<CR>', opts)
map('n', '<leader>e', '<Cmd>Oil<CR>', opts)
map('n', '<leader>E', require("oil").open_float, opts)
map('n', '<leader>lg', '<Cmd>LazyGit<CR>', opts)

map('n', '<leader>lf', vim.lsp.buf.format, opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

map('n', '<leader>f', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<leader>r', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<leader>g', '<Cmd>Telescope live_grep<CR>', opts)

map('n', ',', '<Cmd>BufferPrevious<CR>', opts)
map('n', '.', '<Cmd>BufferNext<CR>', opts)

map('n', '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)

map({'n', 'v', 'x'}, ';', ':', opts)
map({'n', 'v', 'x'}, ':', ';', opts)

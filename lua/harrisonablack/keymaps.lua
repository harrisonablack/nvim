local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>Q', ':wqa<CR>', opts)
map('n', '<leader>bd', ':bd<CR>', opts)
map('n', '<leader>bp', ':bp<CR>', opts)
map('n', '<leader>v', ':vsplit<CR>', opts)

map('n', '<C-F>', '<Cmd>Open .<CR>', opts)
map('n', '<leader>e', '<Cmd>Oil<CR>', opts)


map('n', '<leader>f', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<leader>r', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<leader>g', '<Cmd>Telescope live_grep<CR>', opts)
-- map('n', '<leader>sa', require("actions-preview").code_actions, opts)


map('n', ',', '<Cmd>BufferPrevious<CR>', opts)
map('n', '.', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-x>', '<Cmd>BufferPin<CR>', opts)

map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)

map('n', '<leader>h', ':vert res -5<CR>', opts)
map('n', '<leader>j', ':res -5<CR>', opts)
map('n', '<leader>k', ':res +5<CR>', opts)
map('n', '<leader>l', ':vert res +5<CR>', opts)

-- map('n', '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', opts)
-- map('n', '<leader>xX', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)

map({'n', 'v', 'x'}, ';', ':', opts)
map({'n', 'v', 'x'}, ':', ';', opts)


map('n', '<Esc>', '<cmd>noh<CR>', opts)

map("n", "<leader>la", vim.lsp.buf.code_action, opts)
map('n', '<leader>lf', vim.lsp.buf.format, opts)
map('n', '<leader>ld', vim.diagnostic.open_float, opts)
map('n', '<leader>lt', vim.diagnostic.setloclist, opts)
map('n', '<leader>li', vim.lsp.buf.implementation, opts)
map('n', '<leader>lr', vim.lsp.buf.references, opts)

map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gD', vim.lsp.buf.declaration, opts)


local harpoon = require("harpoon")

map("n", "<leader>a", function() harpoon:list():add() end, opts)
map("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
map("n", "<leader>1", function() harpoon:list():select(1) end, opts)
map("n", "<leader>2", function() harpoon:list():select(2) end, opts)
map("n", "<leader>3", function() harpoon:list():select(3) end, opts)
map("n", "<leader>4", function() harpoon:list():select(4) end, opts)

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- General
map("n", "<leader>o", ":update<CR>:source<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":wqa<CR>", opts)
map("n", "<leader>bd", require("mini.bufremove").delete, opts)
map("n", "<leader>bp", ":bp<CR>", opts)
map("n", "<leader>v", ":vsplit<CR>", opts)

-- Files
map("n", "<C-F>", "<Cmd>Open .<CR>", opts)
map("n", "<leader>e", "<Cmd>Oil<CR>", opts)
map("n", "<leader>E", require("oil").open_float, opts)

-- LSP
map("n", "<leader>lf", vim.lsp.buf.format, opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

map("n", "<leader>sa", require("actions-preview").code_actions, opts)

-- Pickers
map("n", "<leader>f", ":Pick files<CR>", opts)
map("n", "<leader>g", ":Pick grep_live<CR>", opts)
map("n", "<leader>r", ":Pick buffers<CR>", opts)

map("n", ",", ":bn<CR>", opts)
map("n", ".", ":bp<CR>", opts)
map("n", "<C-c>", ":bdelete<>", opts)

-- Windows
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)

map("n", "<leader>h", ":vert res -5<CR>", opts)
map("n", "<leader>j", ":res -5<CR>", opts)
map("n", "<leader>k", ":res +5<CR>", opts)
map("n", "<leader>l", ":vert res +5<CR>", opts)

-- Trouble
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", opts)
map("n", "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", opts)

-- Misc
map({ "n", "v", "x" }, ";", ":", opts)
map({ "n", "v", "x" }, ":", ";", opts)

map({ "n", "v", "x" }, "<Up>", "<Nop>", opts)
map({ "n", "v", "x" }, "<Down>", "<Nop>", opts)
map({ "n", "v", "x" }, "<Left>", "<Nop>", opts)
map({ "n", "v", "x" }, "<Right>", "<Nop>", opts)

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local function with_desc(desc)
  return vim.tbl_extend("force", opts, { desc = desc })
end

map("n", "<leader>o", ":update<CR>:source<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":wqa<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", opts)
map("n", "<leader>bp", ":bp<CR>", opts)
map("n", "<leader>v", ":vsplit<CR>", opts)

map("n", "<C-F>", "<Cmd>Open .<CR>", opts)
map("n", "<leader>e", "<Cmd>Oil<CR>", opts)

map("n", "<leader>f", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<leader>r", "<Cmd>Telescope buffers<CR>", opts)
map("n", "<leader>g", "<Cmd>Telescope live_grep<CR>", opts)

map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)

map("n", "<C-S-h>", ":vert res -5<CR>", opts)
map("n", "<C-S-j>", ":res -5<CR>", opts)
map("n", "<C-S-k>", ":res +5<CR>", opts)
map("n", "<C-S-l>", ":vert res +5<CR>", opts)

map({ "n", "v", "x" }, ";", ":", opts)
map({ "n", "v", "x" }, ":", ";", opts)

map("n", "<Esc>", "<cmd>noh<CR>", opts)

map("n", "<leader>ld", vim.diagnostic.open_float, with_desc("Diagnostics: Show details"))
map("n", "<leader>lt", vim.diagnostic.setloclist, with_desc("Diagnostics: List buffer diagnostics"))

require("which-key").add({
  { "<leader>l", group = "LSP / Diagnostics", mode = { "n", "x" } },
})

local telescope = require("telescope.builtin")

map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, with_desc("LSP: Code actions"))
map("n", "<leader>lf", vim.lsp.buf.format, with_desc("LSP: Format buffer"))
map("n", "<leader>ln", vim.lsp.buf.rename, with_desc("LSP: Rename symbol"))
map("n", "<leader>ly", vim.lsp.buf.type_definition, with_desc("LSP: Go to type definition"))
map("n", "<leader>lh", vim.lsp.buf.signature_help, with_desc("LSP: Signature help"))
map("n", "<leader>ls", telescope.lsp_document_symbols, with_desc("LSP: Find document symbols"))
map("n", "<leader>lw", telescope.lsp_dynamic_workspace_symbols, with_desc("LSP: Find workspace symbols"))
map("n", "<leader>li", telescope.lsp_implementations, with_desc("LSP: Find implementations"))
map("n", "<leader>lr", telescope.lsp_references, with_desc("LSP: Find references"))
map("n", "gd", vim.lsp.buf.definition, with_desc("LSP: Go to definition"))
map("n", "gD", vim.lsp.buf.declaration, with_desc("LSP: Go to declaration"))


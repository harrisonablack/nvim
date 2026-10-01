vim.cmd "colorscheme carbonfox"

require("which-key").setup { win = { border = "rounded" } }
require("which-key").add {
  { "<leader>s", group = "Files / Search" },
  { "<leader>b", group = "Buffers" },
  { "<leader>W", group = "Windows" },
  { "<leader>h", group = "Git hunks" },
  { "<leader>l", group = "LSP / Diagnostics", mode = { "n", "x" } },
}

require("obsidian").setup {
  legacy_commands = false,
  workspaces = {
    { name = "notes", path = vim.fn.expand "~/notes/" },
  },
  picker = { name = "telescope.nvim" },
}
require("render-markdown").setup {}

require("cord").setup {
  display = { theme = "classic" },
  advanced = { discord = { reconnect = { enabled = true } } },
}

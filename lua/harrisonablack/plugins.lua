vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/romgrk/barbar.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/folke/which-key.nvim.git" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
})

require('lualine').setup()
require('barbar').setup()
require('oil').setup()
require('mini.pick').setup()
require('nvim-treesitter').setup()
require('nvim-web-devicons').setup()
require('nvim-autopairs').setup()
require('which-key').setup()
require('ibl').setup()
require('tiny-inline-diagnostic').setup()

require('mason').setup()
require('mason-lspconfig').setup()
require('blink.cmp').setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_and_accept", "fallback" },
  },
  fuzzy = {
    implementation = "rust",
    prebuilt_binaries = {
      force_version = "v1.6.0",
    },
  },
  completion = {
    menu = {
      border = "none",
    },
  },
})

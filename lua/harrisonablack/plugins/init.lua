local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add {
  gh "nvim-lua/plenary.nvim",
  gh "nvim-tree/nvim-web-devicons",
  gh "MunifTanjim/nui.nvim",
  gh "saghen/blink.lib",
  gh "stevearc/oil.nvim",
  gh "malewicz1337/oil-git.nvim",
  gh "EdenEast/nightfox.nvim",
  gh "nvim-telescope/telescope.nvim",
  gh "nvim-telescope/telescope-ui-select.nvim",
  gh "lukas-reineke/indent-blankline.nvim",
  gh "mason-org/mason.nvim",
  gh "neovim/nvim-lspconfig",
  gh "mason-org/mason-lspconfig.nvim",
  gh "mfussenegger/nvim-dap",
  gh "nvim-mini/mini.pairs",
  gh "nvim-treesitter/nvim-treesitter",
  gh "windwp/nvim-ts-autotag",
  gh "j-hui/fidget.nvim",
  gh "vyfor/cord.nvim",
  gh "saghen/blink.cmp",
  gh "obsidian-nvim/obsidian.nvim",
  gh "lewis6991/gitsigns.nvim",
  gh "MeanderingProgrammer/render-markdown.nvim",
  gh "folke/which-key.nvim",
  gh "folke/trouble.nvim",
  gh "nvim-java/nvim-java",
}

require "harrisonablack.plugins.editor"
require "harrisonablack.plugins.lsp"
require "harrisonablack.plugins.ui"

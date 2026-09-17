local gh = function(x)
  return "https://github.com/" .. x
end

vim.pack.add {
  gh "stevearc/oil.nvim",
  gh "EdenEast/nightfox.nvim",
  gh "nvim-telescope/telescope.nvim.git",
  gh "nvim-telescope/telescope-ui-select.nvim.git",
  gh "nvim-lua/plenary.nvim.git",
  gh "nvim-tree/nvim-web-devicons.git",
  gh "malewicz1337/oil-git.nvim.git",
  gh "lukas-reineke/indent-blankline.nvim",
  gh "MunifTanjim/nui.nvim",
  gh "mason-org/mason.nvim.git",
  gh "neovim/nvim-lspconfig.git",
  gh "mason-org/mason-lspconfig.nvim.git",
  gh "mfussenegger/nvim-dap",
  gh "nvim-mini/mini.pairs.git",
  gh "nvim-treesitter/nvim-treesitter.git",
  gh "windwp/nvim-ts-autotag.git",
  gh "j-hui/fidget.nvim.git",
  gh "vyfor/cord.nvim",
  gh "obsidian-nvim/obsidian.nvim.git",
  gh "lewis6991/gitsigns.nvim.git",
  gh "saghen/blink.lib",
  gh "saghen/blink.cmp",
  gh "MeanderingProgrammer/render-markdown.nvim.git",
  gh "folke/which-key.nvim",
  gh "folke/trouble.nvim",
}

require("oil").setup()
require("oil-git").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("telescope").setup {
  defaults = {
    prompt_title = false,
    results_title = false,
    preview_title = false,
    preview = { treesitter = true },
    color_devicons = true,
    sorting_strategy = "ascending",
    borderchars = {
      "", -- top
      "", -- right
      "", -- bottom
      "", -- left
      "", -- top-left
      "", -- top-right
      "", -- bottom-right
      "", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    },
  },
  pickers = {
    find_files = {
      prompt_title = "",
      preview_title = "",
    },
    live_grep = {
      prompt_title = "",
      preview_title = "",
    },
    grep_string = {
      prompt_title = "",
      preview_title = "",
    },
    buffers = {
      prompt_title = "",
      preview_title = "",
    },
    prompt_prefix = "",
    selection_caret = "",
    entry_prefix = "",
  },
}
require("telescope").load_extension "ui-select"
require("mini.pairs").setup()
require("ibl").setup()
require("nvim-ts-autotag").setup()
require("fidget").setup()

require("cord").setup {
  display = {
    theme = "classic",
  },
  advanced = {
    discord = {
      reconnect = {
        enabled = true,
      },
    },
  },
}

vim.cmd "colorscheme carbonfox"

require("obsidian").setup {
  legacy_commands = false,
  workspaces = {
    {
      name = "notes",
      path = "~/notes/",
    },
  },
}

require("gitsigns").setup()

local cmp = require "blink.cmp"
cmp.build():pwait()
cmp.setup {
  fuzzy = { implementation = "lua" },
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_and_accept", "fallback" },
  },
  completion = {
    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          { "label" },
          { "label_description" },
        },
      },
    },
  },
}

require("render-markdown").setup {}
require("trouble").setup()

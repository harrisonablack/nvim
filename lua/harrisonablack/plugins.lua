vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim.git" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
  { src = "https://github.com/malewicz1337/oil-git.nvim.git" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-java/nvim-java.git" },
  { src = "https://github.com/JavaHello/spring-boot.nvim" },
  { src = "https://github.com/nvim-mini/mini.pairs.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
	{ src = "https://github.com/windwp/nvim-ts-autotag.git" },
	{ src = "https://github.com/j-hui/fidget.nvim.git" },
	{ src = "https://github.com/Myriad-Dreamin/tinymist.git" },
})

require("java").setup({
  jdk = {
    auto_install = false,
  },
})
require("oil").setup()
require("oil-git").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("blink.cmp").setup({
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

require("telescope").setup({
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
})
require("telescope").load_extension("ui-select")
require("harpoon").setup()

vim.cmd("colorscheme carbonfox")

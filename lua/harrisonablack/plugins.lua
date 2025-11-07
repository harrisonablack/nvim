vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/folke/trouble.nvim.git" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim.git" },
	{ src = "https://github.com/folke/lazydev.nvim.git" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.starter.git" },
	{ src = "https://github.com/nvim-mini/mini.bufremove.git" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },
	{ src = "https://github.com/romgrk/barbar.nvim.git" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim.git" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	{ src = "https://github.com/vimpostor/vim-tpipeline.git" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator.git" },
})

require("actions-preview").setup {
	backend = { "telescope" },
	telescope = vim.tbl_extend(
		"force",
		require("telescope.themes").get_dropdown(), {}
	)
}
require("lualine").setup({
	options = {
		theme = "tomorrow_night",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype", "lsp_status" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
require("barbar").setup({
	animation = false,
	icons = {
    separator = {left = '', right = ''},
	}
})
require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		autosave_changes = true,
	},
	view_options = {
		show_hidden = true,
	
	}})
require("mini.pairs").setup()
require("mini.starter").setup()
require("trouble").setup()
require("ibl").setup()
require("tiny-inline-diagnostic").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("lazydev").setup()
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

local telescope = require("telescope")
telescope.setup({
	defaults = {
		preview = { treesitter = false },
		color_devicons = true,
		sorting_strategy = "ascending",
		borderchars = {
			"─", -- top
			"│", -- right
			"─", -- bottom
			"│", -- left
			"┌", -- top-left
			"┐", -- top-right
			"┘", -- bottom-right
			"└", -- bottom-left
		},
		path_displays = { "smart" },
		layout_config = {
			height = 100,
			width = 400,
			prompt_position = "top",
			preview_cutoff = 40,
		}
	}
})
telescope.load_extension("ui-select")

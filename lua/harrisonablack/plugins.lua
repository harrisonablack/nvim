vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim.git" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim.git" },
	{ src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" },
	{ src = "https://github.com/kiennt63/harpoon-files.nvim.git" },

	-- LSP
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
	{ src = "https://github.com/saghen/blink.cmp" },
})

require("oil").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("lualine").setup({
	options = {
		theme = "iceberg_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					local modes = {
						["NORMAL"] = "N",
						["VISUAL"] = "V",
						["V-LINE"] = "VL",
						["V-BLOCK"] = "VB",
						["INSERT"] = "I",
						["COMMAND"] = "C",
						["REPLACE"] = "R",
						["TERMINAL"] = "T",
					}
					return modes[str] or str
				end,
			},
		},
		lualine_b = { "filename" },
		lualine_c = { "diagnostics", "branch", "diff" },
		lualine_x = {},
		lualine_y = { require("harpoon_files").lualine_component },
		lualine_z = { "filetype" },
	},
})
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

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
	{ src = "https://github.com/nvim-mini/mini.bufremove.git" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	-- { src = "https://github.com/vimpostor/vim-tpipeline.git" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator.git" },
	{ src = "https://github.com/j-hui/fidget.nvim.git" },
	{ src = "https://github.com/L3MON4D3/LuaSnip.git" },
	{ src = "https://github.com/rafamadriz/friendly-snippets.git" },
	{ src = "https://github.com/pmizio/typescript-tools.nvim" },
	{ src = "https://github.com/harrisonablack/jcr.git" },
	{ src = "https://github.com/windwp/nvim-ts-autotag.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim.git" },
	{ src = "https://github.com/saghen/blink.compat.git" },
	{ src = "https://github.com/kiennt63/harpoon-files.nvim.git" },
	{ src = "https://github.com/ThePrimeagen/harpoon.git",               version = "harpoon2" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim.git" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim.git" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim.git" },
	{ src = "https://github.com/OXY2DEV/markview.nvim.git" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim.git" },
})

require("typst-preview").setup()
require("gitsigns").setup({})
require("mini.pairs").setup()
require("harpoon"):setup()
require("harpoon_files").setup()
require("lualine").setup({
	options = {
		theme = "tomorrow_night",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "diagnostics", "branch", "diff" },
		lualine_x = {},
		-- lualine_x = { "lsp_status" },
		lualine_y = { require("harpoon_files").lualine_component },
		lualine_z = { "filetype" },
	},
})

require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		autosave_changes = true,
	},
	view_options = {
		show_hidden = true,
	},
})

require("ibl").setup()
require("tiny-inline-diagnostic").setup()
require("trouble").setup()

require("mason").setup()
require("mason-lspconfig").setup()
require("lazydev").setup()
require("luasnip").setup({})

require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
	},
	fuzzy = {
		implementation = "rust",
		prebuilt_binaries = {
			force_version = "v1.9.1",
		},
	},
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			markdown = {
				"obsidian",
				"obsidian_new",
				"obsidian_tags",
				"lsp",
				"path",
				"snippets",
			},
		},
		providers = {
			obsidian = {
				name = "obsidian",
				module = "blink.compat.source",
			},
			obsidian_new = {
				name = "obsidian_new",
				module = "blink.compat.source",
			},
			obsidian_tags = {
				name = "obsidian_tags",
				module = "blink.compat.source",
			},
			snippets = {
				opts = {
					friendly_snippets = true,
				},
			},
		},
	},
	completion = {
		menu = {
			border = "none",
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
	},
})

-- Misc
require("nvim-treesitter").setup()
require("fidget").setup()
require("typescript-tools").setup()
require("nvim-ts-autotag").setup()
require("blink.compat").setup()

-- require('render-markdown').setup({
-- 	render_modes = true,
-- 	latex = {
-- 		enabled = true
-- 	}
-- })
-- require("render-markdown").setup({
-- 	render_modes = true,
-- 	latex = {
-- 		enabled = true,
-- 		converter = "latex2text",
-- 	},
-- })

require("obsidian").setup({
	legacy_commands = false, -- this will be removed in the next major release
	workspaces = {
		{
			name = "notes",
			path = "~/vault",
		},
	},
	completion = {
		nvim_cmp = true,
		min_chars = 0,
	},
	templates = {
		folder = "templates",
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

require("markview").setup({
	preview = {
		icon_provider = "devicons", -- "mini" or "devicons"
	},
})

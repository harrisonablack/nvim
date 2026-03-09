
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
	{ src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	{ src = "https://github.com/vimpostor/vim-tpipeline.git" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator.git" },
	{ src = "https://github.com/j-hui/fidget.nvim.git" },
	{ src = "https://github.com/nvim-mini/mini.pick.git" },
	{ src = "https://github.com/L3MON4D3/LuaSnip.git" },
	{ src = "https://github.com/rafamadriz/friendly-snippets.git" },
	{ src = "https://github.com/nvim-mini/mini.diff.git" },
	{ src = "https://github.com/pmizio/typescript-tools.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" },
	{ src = "https://github.com/harrisonablack/jcr.git" },
	{ src = "https://github.com/windwp/nvim-ts-autotag.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
	{ src = "https://github.com/epwalsh/obsidian.nvim.git" },
	{ src = "https://github.com/saghen/blink.compat.git" },
	{ src = "https://github.com/kiennt63/harpoon-files.nvim.git" },
	{ src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" },
})

local win_config = function()
	local height = math.floor(0.618 * vim.o.lines)
	local width = math.floor(0.618 * vim.o.columns)
	return {
		anchor = "NW",
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
	}
end

require("mini.pick").setup({
	window = {
		config = win_config,
	},
})
require("mini.diff").setup()
require("mini.pairs").setup()
require("mini.starter").setup()
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
		lualine_c = {"diagnostics", "branch", "diff"}, 
		lualine_x = {},
		-- lualine_x = { "lsp_status" },
		lualine_y = { require("harpoon_files").lualine_component },
		lualine_z = { "filetype" },
	},
})

-- require("barbar").setup({
-- 	animation = false,
-- 	icons = {
-- 		separator = { left = "", right = "" },
-- 	},
-- })

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

local luasnip = require("luasnip")
luasnip.config.setup({})

	require("blink.cmp").setup({
		keymap = {
			preset = "super-tab",
		},
	fuzzy = {
		implementation = "rust",
		prebuilt_binaries = {
			force_version = "v1.6.0",
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
					{ "kind_icon", "label", "label_description", gap = 1 }, { "kind" },
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


require('render-markdown').setup({})

require("obsidian").setup({
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
	picker = {
		name = "mini.pick",
	},
	templates = {
		folder = "templates",

	}
})

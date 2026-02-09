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
		separator = { left = "", right = "" },
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
		providers = {
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
require("fidget").setup()

require("typescript-tools").setup()

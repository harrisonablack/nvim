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
				{ src = "https://github.com/echasnovski/mini.completion" },
				{ src = "https://github.com/echasnovski/mini.icons" },

})


require('oil').setup()
require('lualine').setup()
require('barbar').setup()
require('mini.pick').setup()
require('mason').setup()
require('mason-lspconfig').setup()

require('mini.completion').setup()
require('mini.icons').setup()

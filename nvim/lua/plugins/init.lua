local plugins = {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = "false",
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				}
			})
			vim.cmd[[colorscheme tokyonight-night]]
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.cmp")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>ntt", ":NvimTreeToggle<CR>", desc = "NvimTree" },
		},
		config = function()
			require("plugins.config.tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.config.lsp")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
}

return plugins

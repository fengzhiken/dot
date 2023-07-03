local plugins = {
	{
		"maxmx03/dracula.nvim",
		config = function()
			vim.cmd[[colorscheme dracula]]
		end,
	},
	--{
	--	"folke/tokyonight.nvim",
	--	config = function()
	--		require("tokyonight").setup({
	--			transparent = "false",
	--			styles = {
	--				sidebars = "transparent",
	--				floats = "transparent",
	--			}
	--		})
	--		vim.cmd[[colorscheme tokyonight-night]]
	--	end,
	--},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.treesitter") end,
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
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
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
		config = function()
			require("plugins.config.cmp")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"sotte/presenting.vim",
		config = function()
			vim.cmd[[
				augroup presentation
					autocmd!
					" Presentation mode
					au Filetype markdown nnoremap <buffer> <F10> :PresentingStart<CR>
					" ASCII art
					au Filetype markdown nnoremap <buffer> <F12> :.!toilet -w 200 -f term -F border<CR>
				augroup end
			]]
		end,
	},
	{
		"lervag/vimtex",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && pnpm install",
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("plugins.config.illuminate")
		end,
	},
	{
		"ellisonleao/carbon-now.nvim",
		opts = {},
		cmd = "CarbonNow",
	},
}

return plugins

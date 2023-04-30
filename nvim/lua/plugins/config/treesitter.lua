require("nvim-treesitter.configs").setup({
  ensure_installed = {
		"lua", "vim", "vimdoc", "query",
		"python",
		"html", "css", "scss",
		"javascript", "typescript", "prisma", "tsx",
		"markdown"
	},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

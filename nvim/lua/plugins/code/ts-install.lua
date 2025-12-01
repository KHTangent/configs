---@type LazySpec
return {
	'lewis6991/ts-install.nvim',
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		ensure_install = {
			"bash",
			"c",
			"cpp",
			"dockerfile",
			"html",
			"go",
			"javascript",
			"json",
			"lua",
			"makefile",
			"markdown",
			"markdown_inline",
			"python",
			"svelte",
			"rust",
			"toml",
			"typescript",
			"vue",
			"yaml",
			"xml",
		},
		auto_install = true,
	},
}

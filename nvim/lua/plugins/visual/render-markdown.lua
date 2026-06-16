---@type LazySpec
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	---@type render.md.UserConfig
	opts = {
		file_types = { "markdown", "codecompanion" },
		completions = {
			lsp = {
				enabled = true,
			},
		},
	},
}

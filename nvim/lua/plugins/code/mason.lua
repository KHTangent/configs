---@type LazySpec
return {
	"mason-org/mason-lspconfig.nvim",
	---@type MasonLspconfigSettings
	opts = {
		ensure_installed = {
			"bashls",
			"cssls",
			"emmet_ls",
			"lua_ls",
			"pylsp",
			"vtsls",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {}
		},
	},
}

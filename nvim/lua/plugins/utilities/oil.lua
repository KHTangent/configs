return {
	"stevearc/oil.nvim",
	---@module "oil"
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
	},
	keys = {
		{
			"<leader>o",
			":Oil --float .<cr>",
			desc = "Edit current directory in Oil.nvim",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}

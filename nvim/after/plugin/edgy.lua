require("edgy").setup({
	animate = {
		enabled = false,
	},
	exit_when_last = true,
	left = {
		{
			title = "Neo-Tree",
			ft = "neo-tree",
			filter = function(buf)
				return vim.b[buf].neo_tree_source == "filesystem"
			end,
			size = { height = 1 },
		},
	},
	right = {
		{
			title = "CodeCompanion",
			ft = "codecompanion",
			size = { height = 1, width = 0.4 },
		},
	},
})

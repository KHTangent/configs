return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = true,
	keys = {
		{
			"<leader>cc",
			":CodeSnap<cr>",
			mode = { "x" },
			desc = "Save selected code snapshot into clipboard",
		},
		{
			"<leader>cs",
			":CodeSnapSave<cr>",
			mode = { "x" },
			desc = "Save selected code snapshot in ~/Desktop",
		},
	},
	opts = {
		save_path = "~/Desktop",
		has_breadcrumbs = false,
		bg_color = "#535c68",
		has_line_number = true,
		watermark = "",
		bg_padding = 10,
	},
}

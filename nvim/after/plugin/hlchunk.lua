require("hlchunk").setup({
	indent = {
		use_treesitter = false,
		chars = {
			"│",
		},
		style = {
			"#FF0000",
			"#FF7F00",
			"#FFFF00",
			"#00FF00",
			"#00FFFF",
			"#0000FF",
			"#8B00FF",
		},
	},
	chunk = {
		enable = false,
	},
	blank = {
		enable = false,
	},
	context = {
		enable = false,
	},
	line_num = {
		enable = false,
	}
})

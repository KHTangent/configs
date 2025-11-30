---@type LazySpec
return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		symbol_in_winbar = {
			enable = false,
			show_file = false,
		},
		code_action = {
			keys = {
				quit = "<Esc>"
			}
		},
		rename = {
			keys = {
				quit = "<Esc>"
			}
		},
		lightbulb = {
			virtual_text = false
		},
	},
	keys = {
		{
			"<leader>vc",
			"<cmd>Lspsaga code_action<CR>",
			remap = false,
			desc = "View code actions",
		},
		{
			"<leader>vd",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			remap = false,
			desc = "View diagnostic in float window",
		},
		{
			"<leader>dn",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			remap = false,
			desc = "Goto next diagnostic",
		},
		{
			"<leader>dp",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			remap = false,
			desc = "Goto prev diagnostic",
		},
		{
			"K",
			"<cmd>Lspsaga hover_doc<CR>",
			remap = false,
			desc = "Display hover doc",
		},
		{
			"<leader>vn",
			"<cmd>Lspsaga rename<CR>",
			remap = false,
			desc = "Rename symbol",
		},
	}
}

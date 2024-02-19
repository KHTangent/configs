local saga = require("lspsaga")

saga.setup({
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
})

vim.keymap.set("n", "<leader>vc", "<cmd>Lspsaga code_action<CR>", {
	remap = false,
	desc = "View code actions",
})
vim.keymap.set("n", "<leader>vd", "<cmd>Lspsaga diagnostic_jump_next<CR>", {
	remap = false,
	desc = "View diagnostic in float window",
})
vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", {
	remap = false,
	desc = "Goto next diagnostic",
})
vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {
	remap = false,
	desc = "Goto prev diagnostic",
})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
	remap = false,
	desc = "Display hover doc",
})
vim.keymap.set("n", "<leader>vn", "<cmd>Lspsaga rename<CR>", {
	remap = false,
	desc = "Rename symbol",
})

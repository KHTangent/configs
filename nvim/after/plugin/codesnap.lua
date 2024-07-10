local codesnap = require("codesnap")

codesnap.setup({
	save_path = "~/Desktop",
	has_breadcrumbs = false,
	bg_color = "#535c68",
	has_line_number = true,
	watermark = "",
	bg_padding = 10,
})

vim.keymap.set("x", "<leader>cc", ":CodeSnap<cr>", {desc = "Save selected code snapshot into clipboard"})
vim.keymap.set("x", "<leader>cs", ":CodeSnapSave<cr>", {desc = "Save selected code snapshot in ~/Desktop"})

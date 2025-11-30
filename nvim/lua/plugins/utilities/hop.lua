---@type LazySpec
return {
	"smoka7/hop.nvim",
	config = function()
		local hop = require("hop")
		hop.setup()

		vim.keymap.set("n", "<leader>l", hop.hint_words, {desc = "Hop to word"})
		vim.keymap.set("n", "<leader>a", hop.hint_camel_case, {desc = "Hop camelcase"})
	end,
}

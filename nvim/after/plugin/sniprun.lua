local sniprun = require("sniprun")

sniprun.setup({
	display = {
		"TempFloatingWindow"
	},
})

vim.keymap.set("n", "<leader>cr", function ()
	sniprun.run()
end, {desc = "Run code line"})
vim.keymap.set("v", "<leader>cr", function ()
	sniprun.run("v")
end, {desc = "Run selected code lines"})


local neogit = require("neogit")

neogit.setup({
	auto_show_console = true,
	integrations = {
		diffview = true
	}
})

vim.keymap.set("n", "<leader>gs", function()
	neogit.open({kind = "tab"})
end, {desc = "Open neogit"})


require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "ollama",
			model = "qwen2.5-coder:7b",
		},
		inline = {
			adapter = "ollama",
			model = "qwen2.5-coder:7b",
		},
		cmd = {
			adapter = "ollama",
			model = "qwen2.5-coder:7b",
		},
	},
	display = {
		chat = {
			window = {
				pos = "right",
			},
		},
	},
})

vim.keymap.set({ "n", "v" }, "gma", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "gmc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "gmA", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

vim.loader.enable(false)

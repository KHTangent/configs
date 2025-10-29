require("codecompanion").setup({
	adapters = {
		http = {
			localgood = function()
				return require("codecompanion.adapters.http").extend("openai_compatible", {
					name = "localgood",
					schema = {
						model = {
							default = "gpt-oss:20b",
						},
						env = {
							url = "http://localhost:11434",
						},
					},
				})
			end
		},
	},
	strategies = {
		chat = {
			adapter = "localgood",
		},
		inline = {
			adapter = "localgood",
		},
		cmd = {
			adapter = "localgood",
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

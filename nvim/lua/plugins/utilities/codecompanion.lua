---@type LazySpec
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		vim.loader.enable(false)
	end,
	opts = {
		{
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
		}
	},
	keys = {
		{
			"gma",
			"<cmd>CodeCompanionActions<cr>",
			noremap = true,
			silent = true,
			desc = "CodeCompanion Actions",
			mode = { "n", "v" },
		},
		{
			"gmc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			noremap = true,
			silent = true,
			desc = "CodeCompanion Chat",
			mode = { "n", "v" },
		},
		{
			"gmA",
			"<cmd>CodeCompanionChat Add<cr>",
			noremap = true,
			silent = true,
			desc = "CodeCompanion Add",
			mode = { "v" },
		},

	},

}

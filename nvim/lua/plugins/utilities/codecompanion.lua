---@type LazySpec
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	version = "^18.0.0",
	init = function()
		vim.loader.enable(false)
	end,
	opts = {
		adapters = {
			http = {
				localgood = function()
					return require("codecompanion.adapters.http").extend("openai_compatible", {
						name = "localgood",
						env = {
							api_key = "OWU_API_KEY",
							url = "OWU_HOST",
							chat_url = "/chat/completions",
							models_endpoint = "/models",
						},
						headers = {
							["Content-Type"] = "application/json",
							Authorization = "Bearer ${api_key}",
						},
						schema = {
							model = {
								default = "gpt-oss:120b",
							},
						},
						parameters = {
							sync = true,
						},
					})
				end
			},
		},
		interactions = {
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

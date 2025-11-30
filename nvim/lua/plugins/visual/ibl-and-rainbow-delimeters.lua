local highlight = {
	"RainbowRed",
	"RainbowOrange",
	"RainbowYellow",
	"RainbowGreen",
	"RainbowCyan",
	"RainbowBlue",
	"RainbowViolet",
}

---@type LazySpec
return {
	{
		"hiphish/rainbow-delimiters.nvim",
		init = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					vim = rainbow_delimiters.strategy['local'],
				},
				blacklist = {
					"html",
					"vue",
					"svelte",
					"xml",
					"markdown",
				},
				query = {
					[''] = 'rainbow-delimiters',
				},
				highlight = highlight
			}
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local hooks = require "ibl.hooks"
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF0000" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF7F00" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFFF00" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00FF00" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00FFFF" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0000FF" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#8B00FF" })
			end)
			require("ibl").setup({
				indent = {
					highlight = highlight,
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = false,
				}
			})
		end
	},
}

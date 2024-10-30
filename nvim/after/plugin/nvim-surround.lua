require("nvim-surround").setup({
	surrounds = {
		["("] = false,
		["["] = false,
		["{"] = false,
	},
	aliases = {
		["("] = ")",
		["["] = "]",
		["{"] = "}",
	},
})

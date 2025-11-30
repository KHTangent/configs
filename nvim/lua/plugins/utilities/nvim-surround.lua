---@type LazySpec
return {
	"kylechui/nvim-surround",
	opts = {
		surrounds = {
			["("] = false,
			["["] = false,
			["{"] = false,
			["<"] = false,
		},
		aliases = {
			["("] = ")",
			["["] = "]",
			["{"] = "}",
			["<"] = ">",
		},
	}
}

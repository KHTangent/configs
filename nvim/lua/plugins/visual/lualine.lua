local function breadcrumbs()
	local bar = require("lspsaga.symbol.winbar").get_bar()
	if bar == nil then
		return ""
	end
	return bar
end

---@type LazySpec
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		options = {
			theme = "dracula",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { breadcrumbs },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	}
}

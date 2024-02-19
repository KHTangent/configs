local lualine = require("lualine")
local lspsaga_bar = require("lspsaga.symbol.winbar")

local function breadcrumbs()
	local bar = lspsaga_bar.get_bar()
	if bar == nil then
		return ""
	end
	return bar
end

local lualine_options = {
	options = {
		theme = "dracula",
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff", "diagnostics"},
		lualine_c = {breadcrumbs},
		lualine_x = {"encoding", "fileformat", "filetype"},
		lualine_y = {"progress"},
		lualine_z = {"location"},
	},
}

lualine.setup(lualine_options)

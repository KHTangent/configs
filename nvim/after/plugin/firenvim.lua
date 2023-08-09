local function setMinimumHeight()
	local height = vim.o.lines
	if height < 10 then
		vim.o.lines = 10
	end
end

if vim.g.started_by_firenvim == true then
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		pattern = "*",
		callback = setMinimumHeight
	})
end

vim.g.firenvim_config = {
	localSettings = {
		[".*"] = {
			cmdline = "neovim",
			content = "text",
			takeover = "never",
		},
	},
}

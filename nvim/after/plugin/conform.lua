local conform = require("conform")

local prettier_list = {"prettierd", "prettier", stop_after_first = true}

conform.setup({
	formatters_by_ft = {
		javascript = prettier_list,
		typescript = prettier_list,
		html = prettier_list,
		vue = prettier_list,
	},
})

vim.keymap.set("n", "<S-A-F>", function ()
	conform.format({lsp_fallback = true})
end, {desc = "Format document"})

vim.keymap.set("v", "<S-A-F>", function ()
	conform.format({lsp_fallback = true})
end, {desc = "Format selection"})

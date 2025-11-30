local prettier_list = { "prettierd", "prettier", stop_after_first = true }

---@type LazySpec
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = prettier_list,
			typescript = prettier_list,
			html = prettier_list,
			vue = prettier_list,
		},
	},
	keys = {
		{
			"<S-A-F>",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Format document"
		},
		{
			"<S-A-F>",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Format selection",
			mode = { "x" },
		}

	}
}

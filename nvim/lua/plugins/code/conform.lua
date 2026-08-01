local js_formatters = { "eslint_d", "prettierd", "prettier", stop_after_first = true }

---@type LazySpec
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = js_formatters,
			typescript = js_formatters,
			html = js_formatters,
			vue = js_formatters,
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

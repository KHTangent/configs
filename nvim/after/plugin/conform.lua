local conform = require("conform")
conform.setup()

vim.keymap.set("n", "<S-A-F>", function ()
	conform.format({lsp_fallback = true})
end, {desc = "Format document"})

vim.keymap.set("v", "<S-A-F>", function ()
	conform.format({lsp_fallback = true})
end, {desc = "Format selection"})

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"lua_ls",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false
})

lsp.on_attach(function(client, bufnr)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {
		buffer = bufnr,
		remap = false,
		desc = "Go to definition",
	})
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {
		buffer = bufnr,
		remap = false,
		desc = "Display hover",
	})
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {
		buffer = bufnr,
		remap = false,
		desc = "Workspace symbol",
	})
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {
		buffer = bufnr,
		remap = false,
		desc = "View diagnostic in float window",
	})
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {
		buffer = bufnr,
		remap = false,
		desc = "Goto next diagnostic",
	})
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {
		buffer = bufnr,
		remap = false,
		desc = "Goto prev diagnostic",
	})
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {
		buffer = bufnr,
		remap = false,
		desc = "View code actions",
	})
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {
		buffer = bufnr,
		remap = false,
		desc = "View references",
	})
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {
		buffer = bufnr,
		remap = false,
		desc = "Rename symbol",
	})
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {
		buffer = bufnr,
		remap = false,
		desc = "Signature help",
	})
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

vim.keymap.set("n", "<S-A-F>", ":LspZeroFormat<CR>", {desc = "Format document"})


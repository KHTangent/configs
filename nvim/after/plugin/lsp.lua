local lsp = require("lsp-zero")
local telescope_builtin = require("telescope.builtin")

lsp.preset("recommended")

lsp.ensure_installed({
	"bashls",
	"cssls",
	"emmet_ls",
	"haxe_language_server",
	"lua_ls",
	"marksman",
	"pylsp",
	"texlab",
	"tsserver",
	"volar",
	"yamlls",
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

if vim.fn.executable("clangd") then
	lsp.configure("clangd", {
		force_setup = true,
	})
end

lsp.configure("rust_analyzer", {
	force_setup = true,
})

lsp.configure("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false
				}
			}
		}
	}
})

lsp.configure("tsserver", {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = require("mason-registry")
					.get_package("vue-language-server")
					:get_install_path() .. "/node_modules/@vue/language-server",
				languages = {"javascript", "typescript", "vue"},
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
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
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
		buffer = bufnr,
		remap = false,
		desc = "View signature help",
	})
	vim.keymap.set("n", "<leader>vw", telescope_builtin.lsp_workspace_symbols, {
		buffer = bufnr,
		remap = false,
		desc = "Workspace symbol",
	})
	vim.keymap.set("n", "<leader>vr", telescope_builtin.lsp_references, {
		buffer = bufnr,
		remap = false,
		desc = "View references",
	})
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {
		buffer = bufnr,
		remap = false,
		desc = "Signature help",
	})
	vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.hover() end, {
		buffer = bufnr,
		remap = false,
		desc = "Display hover",
	})
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

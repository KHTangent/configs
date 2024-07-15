local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local telescope_builtin = require("telescope.builtin")
local cmp = require("cmp")

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
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
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		-- Fix Undefined global 'vim'
		lua_ls = function ()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})
		end,

		pylsp = function ()
			lspconfig.pylsp.setup({
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
		end,

		tsserver = function ()
			lspconfig.tsserver.setup({
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
		end
	},
})


local cmp_mappings = {
	["<C-y>"] = cmp.mapping.confirm({select = true}),
	["<C-e>"] = cmp.mapping.abort(),
	["<Up>"] = cmp.mapping.select_prev_item({behavior = "select"}),
	["<Down>"] = cmp.mapping.select_next_item({behavior = "select"}),
	["<C-p>"] = cmp.mapping(function()
		if cmp.visible() then
			cmp.select_prev_item({behavior = "insert"})
		else
			cmp.complete()
		end
	end),
	["<C-n>"] = cmp.mapping(function()
		if cmp.visible() then
			cmp.select_next_item({behavior = "insert"})
		else
			cmp.complete()
		end
	end),
	["<CR>"] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
}

cmp.setup({
	sources = {
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "path"},
		{name = "luasnip"},
		{name = "nvim_lua"},
		{name = "html-css"},
	},
	formatting = lsp_zero.cmp_format({details = true}),
	mapping = cmp_mappings,
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

lsp_zero.on_attach(function(_, bufnr)
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

vim.diagnostic.config({
	virtual_text = true
})

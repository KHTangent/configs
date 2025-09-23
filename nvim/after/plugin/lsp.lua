local mason_lspconfig = require("mason-lspconfig")
local telescope_builtin = require("telescope.builtin")
local cmp = require("cmp")
local luasnip = require("luasnip")

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"emmet_ls",
		"lua_ls",
		"pylsp",
		"vtsls",
		"yamlls",
	},
})

local function enable_ls_if_executable(name, configname)
	configname = configname or name
	if vim.fn.executable(name) then
		vim.lsp.enable(configname)
	end
end
enable_ls_if_executable("clangd")
enable_ls_if_executable("nil")
enable_ls_if_executable("rust-analyzer", "rust_analyzer")
enable_ls_if_executable("markdown-oxide", "markdown_oxide")
enable_ls_if_executable("openscad-lsp", "openscad_lsp")
enable_ls_if_executable("gopls")


vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "require" }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		}
	}
})

vim.lsp.config("pylsp", {
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

vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {},
			},
		},
	},
	before_init = function(params, config)
		-- From https://github.com/yioneko/vtsls/issues/148#issuecomment-2119744901
		local result = vim.system(
			{"npm", "query", "#vue"},
			{
				cwd = params.workspaceFolders[1].name,
				text = true,
			}
		):wait()
		if result.stdout ~= "[]" then
			local vuelspath = vim.fn.expand("$MASON/packages/vue-language-server")
			local vuePluginConfig = {
				name = "@vue/typescript-plugin",
				location = vuelspath .. "/node_modules/@vue/language-server",
				languages = {"vue"},
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
		end
	end,
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
})

vim.lsp.config("tinymist", {
	filetypes = { "typst" },
	settings = {
	},
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>tp", function()
			client:exec_cmd({
				title = "pin",
				command = "tinymist.pinMain",
				arguments = { vim.api.nvim_buf_get_name(0) },
			}, { bufnr = bufnr })
		end, { desc = "Tinymist Pin", noremap = true })
		vim.keymap.set("n", "<leader>tu", function()
			client:exec_cmd({
				title = "unpin",
				command = "tinymist.pinMain",
				arguments = { vim.v.null },
			}, { bufnr = bufnr })
		end, { desc = "Tinymist Unpin", noremap = true })
	end,
})


require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({
	paths = { "./snippets" }
})

local cmp_mappings = cmp.mapping.preset.insert({
	['<C-d>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end),
	['<C-b>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end),
	["<CR>"] = cmp.mapping.confirm({select = true}),
	["<C-y>"] = cmp.mapping.confirm({select = true}),
	["<C-e>"] = cmp.mapping.abort(),
	["<Up>"] = cmp.mapping.select_prev_item({behavior = "select"}),
	["<Down>"] = cmp.mapping.select_next_item({behavior = "select"}),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-f>"] = cmp.mapping.scroll_docs(5),
	["<C-u>"] = cmp.mapping.scroll_docs(-5),
	["<C-p>"] = cmp.mapping.select_prev_item({behavior = "select"}),
	["<C-n>"] = cmp.mapping.select_next_item({behavior = "select"}),
})
cmp_mappings["<Tab>"] = cmp.config.disable
cmp_mappings["<S-Tab>"] = cmp.config.disable

cmp.setup({
	sources = {
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "path"},
		{name = "luasnip"},
		{name = "nvim_lua"},
		{name = "emoji"},
	},
	formatting = {
		expandable_indicator = true,
		fields = {"abbr", "kind", "menu"},
		format = require("lspkind").cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			ellipsis_char = '...',
			show_labelDetails = true,
			before = function (_, vim_item)
				local m = vim_item.menu and vim_item.menu or ""
				if #m > 20 then
					vim_item.menu = string.sub(m, 1, 20) .. "..."
				end
				return vim_item
			end
		})
	},
	mapping = cmp_mappings,
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local bufnr = event.buf
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

		-- From https://github.com/neovim/neovim/issues/30985#issuecomment-2447329525
		for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
			local default_diagnostic_handler = vim.lsp.handlers[method]
			vim.lsp.handlers[method] = function(err, result, context)
				if err ~= nil and err.code == -32802 then
					return
				end
				return default_diagnostic_handler(err, result, context)
			end
		end
	end,
})

vim.diagnostic.config({
	virtual_text = true
})

---@type LazySpec
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lua",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

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
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping.abort(),
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-f>"] = cmp.mapping.scroll_docs(5),
			["<C-u>"] = cmp.mapping.scroll_docs(-5),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		})
		cmp_mappings["<Tab>"] = cmp.config.disable
		cmp_mappings["<S-Tab>"] = cmp.config.disable

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "emoji" },
			},
			formatting = {
				expandable_indicator = true,
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = 'symbol',
					maxwidth = 50,
					ellipsis_char = '...',
					show_labelDetails = true,
					before = function(_, vim_item)
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
	end
}

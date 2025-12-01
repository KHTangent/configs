---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	init = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldlevel = 99
		vim.g.loaded_nvim_treesitter = 1
		vim.api.nvim_create_autocmd('FileType', {
			callback = function(event)
				local filetype = event.match
				local bufnr = event.buf
				if filetype == "" then
					return
				end
				local parser_name = vim.treesitter.language.get_lang(filetype)
				if not parser_name then
					return
				end
				local ts_config = require('nvim-treesitter.config')
				if not vim.tbl_contains(ts_config.get_available(), parser_name) then
					return
				end
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.treesitter.start(bufnr, parser_name)
			end,
		})
	end,
}

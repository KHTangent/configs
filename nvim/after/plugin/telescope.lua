local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("import")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find in folder"})
vim.keymap.set("n", "<C-p>", function ()
	builtin.git_files({
		recurse_submodules = true,
	})
end, {desc = "Find in Git files"})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {desc = "View git status"})

vim.keymap.set("n", "<leader>ps", builtin.live_grep, {desc = "Grep in project"})

vim.keymap.set("n", "<leader>fc", builtin.commands, {desc = "Find command"})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {desc = "Find keymaps"})
vim.keymap.set("n", "<leader>cf", builtin.quickfix, {desc = "Find quickfix"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Find help pages"})
vim.keymap.set("n", "<leader>fs", builtin.symbols, {desc = "Find symbols"})
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {desc = "Find workspace symbols"})
vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, {desc = "Find document symbols"})
vim.keymap.set("n", "<leader>fi", ":Telescope import<cr>", {desc = "Find imports"})

-- From https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
local select_one_or_multi = function(prompt_bufnr)
	local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require('telescope.actions').close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				if j.lnum ~= nil then
					vim.cmd(string.format("%s +%s %s", "edit", j.lnum, j.path))
				else
					vim.cmd(string.format("%s %s", "edit", j.path))
				end
			end
		end
	else
		require('telescope.actions').select_default(prompt_bufnr)
	end
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<CR>"] = select_one_or_multi,
			},
		},
		layout_config = {
			horizontal = {
				preview_width = 0.5
			}
		}
	},
	pickers = {
		symbols = {
			layout_config = {
				width = 0.4,
				height = 0.5,
			}
		}
	},
	extensions = {
		import = {
			insert_at_top = true,
		},
	},
})


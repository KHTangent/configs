local function telescope_setup()
	local telescope = require("telescope")
	local builtin = require('telescope.builtin')

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
	telescope.load_extension("ast_grep")

	vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find in folder"})
	vim.keymap.set("n", "<C-p>", function ()
		local current_path = vim.loop.cwd() .. "/.git"
		local is_git_repo, _err = vim.loop.fs_stat(current_path)
		if is_git_repo then
			builtin.git_files({
				recurse_submodules = true,
			})
		else
			builtin.find_files()
		end
	end, {desc = "Find in Git files"})
	vim.keymap.set("n", "<C-S-p>", function ()
		local current_path = vim.loop.cwd() .. "/.git"
		local is_git_repo, _err = vim.loop.fs_stat(current_path)
		if is_git_repo then
			builtin.git_files({
				recurse_submodules = false,
			})
		else
			builtin.find_files()
		end
	end, {desc = "Find in Git files w/o submodules"})
	vim.keymap.set("n", "<leader>gs", builtin.git_status, {desc = "View git status"})

	vim.keymap.set("n", "<leader>ps", builtin.live_grep, {desc = "Grep in project"})

	vim.keymap.set("n", "<leader>fc", builtin.commands, {desc = "Find command"})
	vim.keymap.set("n", "<leader>fk", builtin.keymaps, {desc = "Find keymaps"})
	vim.keymap.set("n", "<leader>cf", builtin.quickfix, {desc = "Find quickfix"})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Find help pages"})
	vim.keymap.set("n", "<leader>fs", builtin.symbols, {desc = "Find symbols"})
	vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {desc = "Find workspace symbols"})
	vim.keymap.set("n", "<leader>ffw", function ()
		builtin.lsp_workspace_symbols({
			symbols = "function",
		})
	end, {desc = "Find document functions"})
	vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, {desc = "Find document symbols"})
	vim.keymap.set("n", "<leader>ffd", function ()
		builtin.lsp_document_symbols({
			symbols = "function",
		})
	end, {desc = "Find document functions"})
	vim.keymap.set("n", "<leader>fa", ":Telescope ast_grep<cr>", {desc = "Grep in AST"})

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
			ast_grep = {
				command = {
					"sg",
					"--json=stream",
				},
			},
		},
	})
end

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = telescope_setup
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"Marskey/telescope-sg",
	}
}

require('gitsigns').setup{
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			local opts = {}
			opts.buffer = bufnr
			opts.desc = desc
			vim.keymap.set(mode, l, r, opts)
		end

		map('n', '<leader>hs', gs.stage_hunk, "Stage hunk")
		map('n', '<leader>hr', gs.reset_hunk, "Reset hunk")
		map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Stage hunk")
		map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Reset hunk")
		map('n', '<leader>hS', gs.stage_buffer, "Stage buffer")
		map('n', '<leader>hu', gs.undo_stage_hunk, "Undo stage hunk")
		map('n', '<leader>hR', gs.reset_buffer, "Reset buffer")
		map('n', '<leader>hp', gs.preview_hunk, "Preview hunk")
		map('n', '<leader>hb', function() gs.blame_line{full=true} end, "Line blame")
		map('n', '<leader>tb', gs.toggle_current_line_blame, "Toggle line blame")
		map('n', '<leader>hd', gs.diffthis, "Hunk diff")
		map('n', '<leader>hD', function() gs.diffthis('~') end, "Diff with ~")
		map('n', '<leader>td', gs.toggle_deleted, "Toggle deleted")

		-- Text object
		map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}

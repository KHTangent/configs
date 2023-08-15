vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.exrc = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "⍿·",
	trail = "·",
	nbsp = "␣",
}

-- Fixes vgit jumping around by enabling signcolumn
vim.opt.signcolumn = "yes"


vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.expandtab = false
vim.opt.fixeol = false
vim.opt.smartindent = true
vim.opt.exrc = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "⍿·",
	trail = "·",
	nbsp = "␣",
}

-- Fixes wrong indentation of cases in C switch statements
vim.opt.cinoptions = "l1"

-- Fixes vgit jumping around by enabling signcolumn
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 300


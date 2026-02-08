vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

-- Search matching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI response
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Visual clarity

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Persistent undo

vim.opt.undofile = true -- persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Enable auto-indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.cmd("filetype plugin indent on")

-- Diagnostics
vim.diagnostic.config({
	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		focus = false,
		scope = "cursor",
	},
})

vim.o.updatetime = 300

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float()
	end,
})

--Disable unnecesary stuff

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1

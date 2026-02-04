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

vim.opt.undofile = true      -- persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Enable auto-indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.cmd("filetype plugin indent on")



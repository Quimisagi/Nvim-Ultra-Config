vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 300
vim.opt.fillchars:append({ eob = " " })
vim.opt.timeoutlen = 500

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true
vim.opt.autoindent = true

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

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if vim.bo.filetype ~= "gitcommit" then
      vim.diagnostic.open_float()
    end
  end,
})

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1

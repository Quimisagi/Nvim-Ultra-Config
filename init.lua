require("config.options")
require("config.editor-mappings")
require("config.plugins-mappings")

-------- LAZY --------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      pcall(function()
        require("gitsigns").refresh()
      end)
    end, 100)
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
vim.cmd("filetype plugin indent on")

-- Color changes

vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = '#FFD700', bg = '#2E2E2E', bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = '#FF4444', bg = '#2E2E2E', bold = true })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = '#FF4444', bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = '#CC3333', bg = '#212121' })


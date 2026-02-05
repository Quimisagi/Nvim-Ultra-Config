return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  init = function()
    -- Optional: recommended setting to avoid keymap conflicts
    vim.g.VM_default_mappings = 1
  end,
}


--Theme
return {
  "uhs-robert/oasis.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("oasis").setup()      -- (see Configuration below for all customization options)
    vim.o.background = "dark"
    vim.cmd.colorscheme("oasis-desert")  -- After setup, apply theme (or any style like "oasis-night")
  end
}

--Theme
return {
  "uhs-robert/oasis.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("oasis").setup({
      palette_overrides = {
        desert = {
          syntax = {
            statement    = "#FFD700",
            conditional  = "#E6B800",
            operator     = "#E6B800",
            delimiter    = "#E6B800",
            exception    = "#FF4444",
            identifier   = "#569CD6",
            builtinVar   = "#569CD6",
            builtinConst = "#569CD6",
          },
        },
      },
    })
    vim.o.background = "dark"
    vim.cmd.colorscheme("oasis-desert")
  end
}

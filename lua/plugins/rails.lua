return {
  "tpope/vim-rails",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.rails_projections = {
      -- Optional: add custom projections if needed
    }
  end,
}

return {
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim", -- required for UI components
    },
    -- lazy load on search commands
    cmd = {
      "SearchBoxIncSearch",
      "SearchBoxMatchAll",
      "SearchBoxReplace",
      "SearchBoxReplaceLast",
    },
    config = function()
      -- Optional: default setup
      require("searchbox").setup({
        -- place your custom opts here, e.g.:
        -- clear_matches = false, -- keep highlights after search
      })

      -- Recommended keymaps (example)
    end,
  },
}

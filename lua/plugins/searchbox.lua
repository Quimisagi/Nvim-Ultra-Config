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
      local map = vim.keymap.set
      map("n", "<leader>s", "<cmd>SearchBoxIncSearch<CR>", { desc = "Incremental search" })
      map("n", "<leader>f", "<cmd>SearchBoxMatchAll<CR>", { desc = "Search all matches" })
      map("n", "<leader>r", "<cmd>SearchBoxReplace<CR>", { desc = "Search & replace" })
    end,
  },
}

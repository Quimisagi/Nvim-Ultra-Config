return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  opts = {
    win_opts = {
      row = vim.o.lines - vim.o.cmdheight - 1,
      col = vim.o.columns - 1,
      relative = "editor",
      anchor = "SE", -- Positioned at the Bottom Right
      width = 40,
      height = 3,
      border = "rounded",
      title = " Screenkey ",
      title_pos = "center",
    },
    compress_after = 3, -- If you press 'j' 4 times, it shows 'j..x4'
    clear_after = 3,    -- Clear the window after 3 seconds of inactivity
  },
  keys = {
    { "<leader>sk", "<cmd>Screenkey<cr>", desc = "Toggle Screenkey" },
  },
}

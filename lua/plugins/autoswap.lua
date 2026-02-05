
return {
  {
    "gioele/vim-autoswap",

    -- lazy load on file open
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      -- Optional: settings to tweak behavior
      -- Enable tmux detection so autoswap tries to switch panes (default off)
      vim.g.autoswap_detect_tmux = 1

      -- If you use a window manager, ensure `title` contains filename
      -- Required by some window switching behavior (via wmctrl)
      vim.o.title = true
      -- leave titlestring default, works fine usually
      -- vim.o.titlestring = "%t - NVIM"

      -- If you don't want read-only fallback, you could set:
      -- vim.g.autoswap_always_readonly = 0
    end,
  },
}

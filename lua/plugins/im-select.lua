return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({
        -- Automatically restores the IME state when returning to insert mode
        set_default_events = { "InsertLeave", "CmdlineLeave" },
      })
    end
  }
}

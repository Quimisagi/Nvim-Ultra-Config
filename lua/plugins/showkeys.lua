return {
  "nvzone/showkeys",
  event = "UIEnter",
  config = function()
    local showkeys = require("showkeys")

    showkeys.setup({
      timeout = 1,
      maxkeys = 5,
      position = "bottom",
    })

    -- Wait for UI + windows to fully initialize
    vim.defer_fn(function()
      showkeys.toggle()
    end, 100)
  end,
}


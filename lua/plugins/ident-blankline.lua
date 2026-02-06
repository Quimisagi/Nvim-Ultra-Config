return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local highlights = {
      "RainbowRed",
      "RainbowOrange",
      "RainbowYellow",
      "RainbowGreen",
      "RainbowBlue",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")

    -- Define highlights (reset on colorscheme change)
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
    end)

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = true,
        highlight = highlights,
        show_start = false,
        show_end = false,
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
      },
    })

    -- Subtle default indent color
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3f4c" })
  end,
}


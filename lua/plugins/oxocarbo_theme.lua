return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000, -- load before all other plugins
  config = function()
    require("kanagawa").setup({
      compile = false, -- set true if you want faster startup (requires :KanagawaCompile)
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- set true if you use a transparent terminal
      dimInactive = false,
      terminalColors = true,

      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Floating windows
          NormalFloat = { bg = theme.ui.bg_float },
          FloatBorder = { fg = theme.ui.border, bg = theme.ui.bg_float },

          -- Telescope
          TelescopeNormal = { bg = theme.ui.bg_float },
          TelescopeBorder = { fg = theme.ui.border, bg = theme.ui.bg_float },

          -- Popup menu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_pmenu },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_pmenu_sel },
          PmenuSbar = { bg = theme.ui.bg_pmenu },
          PmenuThumb = { bg = theme.ui.bg_pmenu_thumb },

          -- Diagnostics
          DiagnosticVirtualTextError = { fg = theme.diag.error },
          DiagnosticVirtualTextWarn  = { fg = theme.diag.warning },
          DiagnosticVirtualTextInfo  = { fg = theme.diag.info },
          DiagnosticVirtualTextHint  = { fg = theme.diag.hint },
        }
      end,
    })

    -- Set colorscheme
    vim.cmd("colorscheme kanagawa-wave")
    -- alternatives:
    -- vim.cmd("colorscheme kanagawa-dragon")
    -- vim.cmd("colorscheme kanagawa-lotus")
  end,
}


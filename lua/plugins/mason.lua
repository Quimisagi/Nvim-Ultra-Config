return {
  -- Mason: core package manager (loads only when needed)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Bridge Mason <-> lspconfig (does NOT auto-install on startup)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- Web
        "html",
        "cssls",
        "ts_ls",
        "jsonls",

        -- Lua
        "lua_ls",

        -- Shell
        "bashls",

        -- Python
        "pyright",

        -- Others
        "yamlls",
        "marksman",
      },
      automatic_installation = false, -- avoid startup cost
    },
  },

  -- Install non-LSP tools (manual / on-demand)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "prettier",
        "black",
        "isort",
        "shfmt",

        -- Linters
        "eslint_d",
        "flake8",
        "shellcheck",
      },
      auto_update = false,
      run_on_start = false, 
    },
  },
}


return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      -- Neovim 0.11+ LSP config API
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("ruby_ls", {
        capabilities = capabilities,
      })

      -- Enable servers (required in 0.11+ — config alone does not start them)
      vim.lsp.enable({ "ts_ls", "html", "cssls", "pyright", "ruby_ls" })
    end,
  },
}


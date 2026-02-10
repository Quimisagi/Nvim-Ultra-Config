return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load when you open a file
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Python: use isort then black
      python = { "isort", "black" },
      -- JS/TS/JSON/HTML: use prettier
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      -- Other major languages
      lua = { "stylua" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      bash = { "shfmt" },
      rust = { "rustfmt" },
    },
  },
}

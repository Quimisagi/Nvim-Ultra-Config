return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

    layout = {
      min_width = 25,
      max_width = 40,
      default_direction = "prefer_right",
      placement = "edge",
    },

    attach_mode = "global",
    close_automatic_events = { "unfocus" },

    show_guides = true,

    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Struct",
    },

    icons = {
      Class = "󰠱 ",
      Function = "󰊕 ",
      Method = "󰆧 ",
      Constructor = "󰆧 ",
      Field = "󰜢 ",
      Variable = "󰀫 ",
      Interface = " ",
      Module = " ",
      Property = "󰜢 ",
    },

    highlight_on_hover = true,
    highlight_on_jump = true,

    autojump = true,
    manage_folds = false,
    link_folds_to_tree = false,

    nerd_font = true,
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
    { "{", "<cmd>AerialPrev<CR>", desc = "Aerial prev symbol" },
    { "}", "<cmd>AerialNext<CR>", desc = "Aerial next symbol" },
  },
}


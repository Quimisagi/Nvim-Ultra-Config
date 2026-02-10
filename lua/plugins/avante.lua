return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- NEVER set to "*"
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",

  opts = {
    instructions_file = "avante.md",

    -- 🔥 Use local Ollama (DeepSeek)
    provider = "ollama",

    ollama = {
      endpoint = "http://127.0.0.1:11434",
      model = "deepseek-coder:6.7b",
      -- model = "qwen2.5:14b", -- optional alternative
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- Optional but highly recommended
    "nvim-mini/mini.pick",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",

    "hrsh7th/nvim-cmp",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",

    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },
}

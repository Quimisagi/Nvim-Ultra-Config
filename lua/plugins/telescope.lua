return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = "Telescope", -- lazy-load when command is used
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "❯ ",
          path_display = { "truncate" },

          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
            width = 0.8,
            height = 0.75,
          },

          mappings = {
            i = {
            },
            n = {
              ["q"] = actions.close,
            },
          },

          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "build/",
            "%.lock",
          },
        },

        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            only_sort_text = true,
          },
          buffers = {
            sort_lastused = true,
            previewer = false,
          },
        },

        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      pcall(telescope.load_extension, "fzf")
    end,
  },
}


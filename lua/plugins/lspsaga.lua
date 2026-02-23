--Tools for improving LSP
return {
  {
    "nvimdev/lspsaga.nvim", -- IMPORTANT: Switch from 'glepnir' (archived) to 'nvimdev'
    branch = "main",
    event = "LspAttach", -- Lazy load when LSP attaches
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        -- 1. Show number of implementations (Code Lens)
        -- This adds virtual text (e.g., "3 implementations") above functions
        implement = {
          enable = true,
          sign = true,
          virtual_text = true, 
        },

        -- 2. Rename (Project Scope)
        -- Lspsaga rename applies to the whole project by default.
        rename = {
          in_select = true,
          auto_save = false, -- Set to true to save all files automatically after rename
          project_max_width = 0.5,
          project_max_height = 0.5,
        },

        -- Finder (Your existing config)
        finder = {
          keys = {
            edit = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = "q",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
          },
        },

        -- UI (Your existing config)
        ui = {
          winblend = 0,
          border = "rounded",
        },
        symbol_in_winbar = { enable = true, show_file = true },

        -- Disable unused features (Your existing config)
        lightbulb = { enable = false },
        diagnostic = { enable = false },
        outline = { enable = false },
        code_action = { enable = false },
        beacon = { enable = false },
      })
      
      -- 3. Set Keymaps
      -- You must explicitly bind the keys to Lspsaga commands
      local keymap = vim.keymap.set
      keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename symbol (Project)" })
      keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true, desc = "LSP Finder" })
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true, desc = "Peek Definition" })
    end,
  },
}

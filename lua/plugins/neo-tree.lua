return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        sources = { "filesystem", "buffers", "git_status" },
        -- THIS IS THE KEY: 
        -- It prevents Neo-tree from trying to manage its own sidebar
        window = {
          position = "float", 
          width = 30,
        },
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = true,
        },
      })
    end,
  },
}

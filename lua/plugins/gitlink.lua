return {
  "ruifm/gitlinker.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("gitlinker").setup({
      callbacks = {
        ["gitlab.tokyo.optim.co.jp"] = require("gitlinker.hosts").get_gitlab_type_url,
      },
      mappings = nil,
    })

    -- 2 usages
    local function get_link(action)
      -- If current buffer is a fugitive:// buffer, switch to a real file buffer first
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname:match("^fugitive://") then
        vim.notify("gitlinker: not supported inside fugitive buffers", vim.log.levels.WARN)
        return
      end
      require("gitlinker").get_buf_range_url(
        vim.fn.mode() == "n" and "n" or "v",
        { action_callback = action }
      )
    end
    vim.keymap.set({ "n", "v" }, "<leader>gy", function()
      get_link(require("gitlinker.actions").open_in_browser)
    end, { desc = "Open git permalink in browser" })
  end,
}

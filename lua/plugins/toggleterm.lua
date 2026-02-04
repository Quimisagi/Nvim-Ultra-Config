return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      size = function(term)
        if term.direction == "vertical" then
          return 50 -- wider vertical terminal (columns)
        elseif term.direction == "horizontal" then
          return 15 -- shorter horizontal terminal (lines)
        end
        return 20 -- fallback (floats, tabs)
      end,

      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "rounded",
        winblend = 0,
      },
    },
  },
}


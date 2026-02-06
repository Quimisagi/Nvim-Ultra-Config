return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "javascript", "typescript", "tsx", "vue", "svelte" },
  config = function()
    require("nvim-ts-autotag").setup({
      enable_close = true,      -- auto close tags
      enable_rename = true,     -- auto rename paired tags
      enable_close_on_slash = false,
    })
  end,
}

-- lua/plugins/closetag.lua
return {
  {
    "alvan/vim-closetag",

    -- load when editing HTML-like files
    ft = { "html", "xhtml", "phtml", "vue", "xml", "htmldjango", "javascriptreact", "typescriptreact" },

    init = function()
      -- optional: set file extensions for closing tag support
      -- adjust to your liking
      vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue,*.jsx,*.tsx"
      vim.g.closetag_filetypes = "html,xhtml,phtml,vue,xml,jsx,tsx"
      vim.g.closetag_xhtml_filetypes = "xhtml,vue,jsx,tsx"
      -- you can also set shortcut if desired
      -- vim.g.closetag_shortcut = ">"
    end,
  },
}


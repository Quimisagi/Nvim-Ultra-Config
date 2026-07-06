--Persistent session reloading
return {
    "rmagatti/auto-session",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("auto-session").setup({
            auto_save_enabled = true,
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },

            close_filetypes_on_save = { "neo-tree" },

            post_restore_cmds = {
                function()
                    pcall(vim.cmd, "Neotree close")
                end,
            },

            session_lens = {
                theme_conf = { border = true },
                previewer = false,
            },
        })

        -- Telescope integration
        require("telescope").load_extension("session-lens")

    end,
}

--Persistent session reloading
return {
    "rmagatti/auto-session",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("auto-session").setup({
            auto_save_enabled = true,
            auto_restore_enabled = false, -- Disable automatic loading on startup
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
            
            -- Optional: configure how the session lens looks
            session_lens = {
                theme_conf = { border = true },
                previewer = false,
            },
        })

        -- Telescope integration
        require("telescope").load_extension("session-lens")

    end,
}

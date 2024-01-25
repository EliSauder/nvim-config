return {
    -- Theme
    {
        "marko-cerovac/material.nvim",
        lazy = true,
        opts = {
        },
        config = function()
            require('material').setup({
                contrast = {
                    terminal = true,
                    sidebars = true,
                    floating_windows = true,
                    cursor_line = true,
                    non_current_windows = true,
                },
                -- TODO: Setup
                plugins = {
                    "nvim-cmp",
                    "telescope",
                    "gitsigns",
                    "nvim-web-devicons",
                    "harpoon",
                    "trouble",
                    "dap"
                },
                disable = {
                    background = true
                },
                high_visibility = {
                    darker = true
                },
                async_loading = true,
                custom_highlights = {
                    LineNr = { fg = "#007789" },
                },
                custom_colors = function(colors)
                    colors.editor.selection = "#22255b"
                end,
            })

            vim.g.material_style = "deep ocean"
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "treesitter"
        }
    },
    "lewis6991/gitsigns.nvim",
}

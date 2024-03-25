return {
    -- Theme
    {
        "marko-cerovac/material.nvim",
        branch = "main",
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
                    "dap",
                    "fidget",
                    "gitsigns",
                    "harpoon",
                    "nvim-cmp",
                    "nvim-web-devicons",
                    "telescope",
                    "trouble"
                },
                disable = {
                    background = true
                },
                high_visibility = {
                    darker = true
                },
                async_loading = true,
                custom_highlights = {
                    LineNr = { fg = "#0B9FB6" },
                    CursorLine = {
                        bg = "#243A41",
                        underline = true,
                    },
                    CursorColumn = {
                        bg = "#243A41",
                        underline = false,
                    }
                },
                custom_colors = function(colors)
                    colors.editor.selection = "#363A92"
                end,
            })

            vim.g.material_style = "deep ocean"
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        branch = "master",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = 'material-stealth'
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "prichrd/netrw.nvim",
        branch = "master",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('netrw').setup({
                use_devicons = true
            })
        end
    }
}

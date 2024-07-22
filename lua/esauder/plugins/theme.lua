return {
    -- Theme
    {
        "marko-cerovac/material.nvim",
        priority = 1000,
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
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            style = "storm",
            term_colors = true,
            transparent = false,
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            term_colors = true,
            transparent_background = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                fidget = true,
                harpoon = true,
                mason = true,
                dap = true,
                semantic_tokens = true,
                nvim_surround = true,
                treesitter_context = true,
                telescope = {
                    enabled = true
                },
                lsp_trouble = true,
            }
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                component_separators = ' ',
                section_separators = { left = ' ', right = ' ' },
            },
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "prichrd/netrw.nvim",
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

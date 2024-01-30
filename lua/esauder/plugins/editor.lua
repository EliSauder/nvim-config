return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {}
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-tree/nvim-web-devicons",
            "theprimeagen/harpoon",
        },
        config = function()
            require('telescope').setup()
            require("telescope").load_extension("notify")
            require('telescope').load_extension('harpoon')
        end
    },
    {
        "mbbill/undotree",
        branch = "master",
        event = "VeryLazy"
    },
    {
        "fedepujol/move.nvim",
        branch = "main",
        event = "VeryLazy"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        version = "*",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "folke/trouble.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "hrsh7th/nvim-cmp"
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end
    },
    {
        "danymat/neogen",
        version = "*",
        dependencies = {
            "mfussenegger/nvim-dap",
            "L3MON4D3/LuaSnip",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require('neogen').setup({
                snippet_engine = "luasnip"
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        branch = "master",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
                strict = true,
            })
        end
    },
    {
        "rcarriga/nvim-notify",
        priority = 1000,
        lazy = false,
        config = function()
            require("notify").setup({
                background_colour = require("material.colors").backgrounds.floating_windows,
                timeout = 1000,
                render = "default",
                stages = "fade"
            })
            vim.notify = require("notify")
        end
    }
}

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
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-tree/nvim-web-devicons",
            "theprimeagen/harpoon",
        },
        config = function()
            require('telescope').setup({})
            require('telescope').load_extension('harpoon')
        end
    },
    {
        "mbbill/undotree",
        event = "VeryLazy"
    },
    {
        "fedepujol/move.nvim",
        event = "VeryLazy"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
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
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "danymat/neogen",
        dependencies = {
            "mfussenegger/nvim-dap",
            "L3MON4D3/LuaSnip",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require('neogen').setup({
                enabled = true,
                snippet_engine = "luasnip",
                languages = {
                    cs = {
                        template = {
                            annotation_convention = "xmldoc"
                        }
                    }
                }
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
                strict = true,
            })
        end
    },
}

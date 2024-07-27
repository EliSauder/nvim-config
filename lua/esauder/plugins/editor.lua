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
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
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
        event = "VeryLazy",
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {
            check_ts = true,
            enable_check_bracket_line = false
        }
    },
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {},
        cmd = "Trouble"
    },
    {
        "danymat/neogen",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            enabled = true,
            snippet_engine = "luasnip",
            languages = {
                cs = {
                    template = {
                        annotation_convention = "xmldoc"
                    }
                }
            }
        }
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {
            default = true,
            strict = true,
        }
    },
}

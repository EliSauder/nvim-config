return {
    {
        "theprimeagen/harpoon",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
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
        event = "VeryLazy",
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
    }
}

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
                timeout = 3000,
                render = "default",
                stages = "fade"
            })
            vim.notify = require("notify")
        end
    }
}

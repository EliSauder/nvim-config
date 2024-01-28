return {
    {
        "theprimeagen/harpoon",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        branch = "0.1.x",
        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        "mbbill/undotree",
        lazy = false
    },
    {
        "fedepujol/move.nvim",
        lazy = false,
    },
    "folke/trouble.nvim",
    {
        "danymat/neogen",
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
        lazy = false,
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
                strict = true,
            })
        end
    }
}

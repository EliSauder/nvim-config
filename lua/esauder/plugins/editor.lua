return {
    {
        "theprimeagen/harpoon",
        dependencies = {
            "plenary"
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        branch = "0.1.x",
        dependencies = {
            "plenary",
            "treesitter",
            "devicons"
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
            "treesitter",
            "luasnip"
        },
        config = function()
            require('neogen').setup({
                snipped_engine = "luasnip"
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        name = "devicons",
        lazy = false,
        config = function()
            require("nvim-web-devicons").setup({
                default = true;
                strict = true;
            })
        end
    }
}
    

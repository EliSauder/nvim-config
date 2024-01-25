return {
    {
        "mfussenegger/nvim-dap",
        name = "dap"
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "dap",
            "mason"
        }
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "dap",
            "treesitter"
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "dap"
        }
    },
}

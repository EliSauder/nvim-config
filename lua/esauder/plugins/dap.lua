return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "bash",
                    "coreclr",
                    "codelldb",
                    "cpptools",
                    "delve"
                },
                automatic_installation = false,
                handlers = {}
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = { "BufReadPre", "BufNewFile" },
        branch = "master",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("nvim-dap-virtual-text").setup({
                virt_text_pos = "inline"
            })
        end
    },
    {
        "leoluz/nvim-dap-go",
        branch = "main",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {}
    },
    {
        "mfussenegger/nvim-dap",
        version = "*",
    },
}

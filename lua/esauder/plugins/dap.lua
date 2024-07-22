return {
    {
        "jay-babu/mason-nvim-dap.nvim",
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
                automatic_installation = true,
                handlers = {}
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
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
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {}
    },
    {
        "mfussenegger/nvim-dap",
    },
}

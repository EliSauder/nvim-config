vim.api.nvim_create_autocmd("User", {
    pattern = "DapStart",
    group = "DapGroup",
    callback = function()
        require("lazy").load({
            plugins = {
                "jay-babu/mason-nvim-dap.nvim",
                "rcarriga/nvim-dap-ui",
                "theHamsta/nvim-dap-virtual-text",
            }
        })
    end
})

return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap"
        },
        opts = {
            ensure_installed = {
                "bash",
                "coreclr",
                "codelldb",
                "cpptools",
                "delve"
            },
            automatic_installation = true,
            handlers = {}
        }
    },
    {
        "rcarriga/nvim-dap-ui",
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
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            virt_text_pos = "inline"
        }
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
        config = function()
            vim.api.nvim_exec_autocmds("User", {
                pattern = "DapStart",
                group = "DapGroup",
            })
        end
    },
}

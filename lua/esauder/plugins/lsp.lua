return {
    { 
        "williamboman/mason.nvim",
        name = "mason"
    },
    {
        "neovim/nvim-lspconfig",
        name = "lspconfig",
        dependencies = {
            "mason-lspconfig"
        }
    },
    {
        "nvimtools/none-ls.nvim",
        name = "none-ls",
            dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "none-ls",
            "mason",
        }
    },
    { 
        "williamboman/mason-lspconfig.nvim", 
        name = "mason-lspconfig", 
        dependencies= {
            "mason"
        }
    },
    --[[ LANGUAGE SPECIFIC ]]--
    -- Java/Kotlin
    {
        "mfussenegger/nvim-jdtls"
    },
    -- C#
    {
        "Decodetalkers/csharpls-extended-lsp.nvim"
    }
}

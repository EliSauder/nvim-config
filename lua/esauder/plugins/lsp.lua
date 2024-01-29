------------------------
-- [[ LSP HANDLERS ]] --
------------------------
local default_settings = function()
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    return { capabilities = lsp_capabilities }
end

local default_lsp_handler = function(server)
    require("lspconfig")[server].setup(default_settings())
end

local arduino_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").arduino_language_server.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        cmd = {
            "arduino-language-server", "-cli-config",
            vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
            "-format-conf-path",
            require('lspconfig.util').root_pattern('.clang-format')(
                vim.fn.getcwd()) .. "/.clang-format"
        }
    })
end

local yamlls_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").yamlls.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        settings = {
            yaml = {
                keyOrdering = false,
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
                }
            }
        }
    })
end

local csharpls_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").csharp_ls.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        handlers = {
            ["textDocument/definition"] = require('csharpls_extended').handler
        },
        on_attach = function(client, _)
            if client.server_capabilities.documentFormattingProvider then
                client.server_capabilities.documentFormattingProvider = false
            end
            if client.server_capabilities.documentRangeFormattingProvider then
                client.server_capabilities.documentRangeFormattingProvider =
                    false
            end
        end
    })
end

local clangd_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").clangd.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
    })
end

local luals_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").lua_ls.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } },
                workspace = { library = { vim.env.VIMRUNTIME } }
            }
        }
    })
end

------------------------
-- [[ PLUGIN SETUP ]] --
------------------------
return {
    -- [[ MASON ]] --
    {
        "williamboman/mason-lspconfig.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "neovim/nvim-lspconfig", "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer", "clangd", "bashls", "lua_ls", "csharp_ls"
                },
                handlers = {
                    default_lsp_handler,
                    clangd = clangd_lsp_handler,
                    csharp_ls = csharpls_lsp_handler,
                    yamlls = yamlls_lsp_handler,
                    arduino_language_server = arduino_lsp_handler,
                    lua_ls = luals_lsp_handler
                }
            })
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvimtools/none-ls.nvim", "williamboman/mason.nvim" },
        config = function()
            require('mason-null-ls').setup({
                ensure_installed = { "commitlint", "clang-format" },
                automatic_installation = false,
                handlers = {}
            })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        version = "*"
    },
    {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        branch = "master"
    },
    {
        "j-hui/fidget.nvim",
        version = "*",
        config = function() require('fidget').setup() end
    }, --[[ Base Plugins ]] --
    {
        "neovim/nvim-lspconfig",
        version = "*",
        dependencies = {
            "williamboman/mason-lspconfig.nvim", "j-hui/fidget.nvim"
        },
        event = { "BufReadPre", "BufNewFile" },
        opt = {
            diagnostics = { underline = true, severity_sort = true },
            inlay_hints = { enabled = true }
        }
    }, {
    "nvimtools/none-ls.nvim",
    branch = "main",
    dependencies = { "nvim-lua/plenary.nvim" }
}, {
    "williamboman/mason.nvim",
    version = "*",
    config = function() require('mason').setup() end
}
}

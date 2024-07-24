------------------------
-- [[ LSP HANDLERS ]] --
------------------------
local default_settings = function()
    local lspsettings =
        vim.tbl_deep_extend("force",
            require("lspconfig").util.default_config,
            {
                capabilities = vim.tbl_deep_extend("force",
                    vim.lsp.protocol.make_client_capabilities(),
                    require("cmp_nvim_lsp").default_capabilities())
            })
    lspsettings.offsetEncodings = { "utf-8" }
    lspsettings.capabilities.offset_encoding = "utf-8"

    vim.lsp.set_log_level("debug")
    return lspsettings
end

local default_lsp_handler = function(server)
    require("lspconfig")[server].setup(default_settings())
end

local arduino_lsp_handler = function()
    local defaults = default_settings();
    defaults.capabilities.semanticTokensProvider = nil
    defaults.capabilities.textDocument.semanticTokens = nil
    defaults.capabilities.workspace.semanticTokens = nil
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
            redhat = {
                telemetry = {
                    enabled = false
                }
            },
            yaml = {
                completion = true,
                customTags = {},
                disableAdditionalProperties = false,
                hover = true,
                maxItemsComputed = 5000,
                schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/api/json/catalog.json",
                },
                trace = {
                    server = "off"
                },
                validate = true,
                format = {
                    enable = true,
                    singleQuote = false,
                    bracketSpacing = true,
                    printWidth = 80,
                    proseWrap = "preserve"
                },
                keyOrdering = false,
                schemas = {
                    ["https://json.schemastore.org/clang-format.json"] = ".clang-format",
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["https://json.schemastore.org/clangd.json"] = ".clangd",
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
            ["textDocument/definition"] = require('csharpls_extended').handler,
            ["textDocument/typeDefinition"] = require('csharpls_extended').handler
        },
        on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,
    })
end

local clangd_lsp_handler = function()
    local defaults = default_settings();
    require("lspconfig").clangd.setup({
        capabilities = defaults.capabilities,
        settings = {
            clangd = {
                checkUpdates = true,
                detectExtensionConflicts = true,
                enableCodeCompletion = true,
                restartAfterCrash = true,
                semanticHighlighting = true,
                serverCompletionRanking = true,
            }
        },
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

local gopls_lsp_handler = function()
    local defaults = default_settings()
    require("lspconfig").gopls.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                semanticTokens = true,
                analyses = {
                    unusedparams = true,
                    unusedwrite = true,
                    useany = true,
                    shadow = true,
                    fieldalignment = true,
                },
                staticcheck = true,

            }
        }
    })
end

local jsonls_lsp_handler = function()
    local defaults = default_settings()
    require("lspconfig").jsonls.setup({
        capabilities = defaults.capabilities,
        on_init = defaults.on_init,
        settings = {
            json = {
                trace = {
                    server = "off"
                },
                schemaDownload = {
                    enable = true,
                },
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            }
        }
    })
end

local commitlint_nonels_handler = function(_, _)
    local path = vim.fn.expand("$HOME/.config/commitlint/commitlint.config.js")
    local arg = "--config=" .. path
    require("null-ls").register(require("null-ls").builtins.diagnostics.commitlint.with({
        filetypes = {
            "gitcommit"
        },
        extra_args = {
            arg
        }
    }))
end

------------------------
-- [[ PLUGIN SETUP ]] --
------------------------
return {
    -- [[ MASON ]] --
    {
        "EliSauder/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "EliSauder/nvim-lspconfig",
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "arduino_language_server",
                    "bashls",
                    "clangd",
                    "cmake",
                    "csharp_ls",
                    "jsonls",
                    "lua_ls",
                    "lemminx",
                    "yamlls",
                    "rust_analyzer",
                    "taplo",
                    "gopls",
                    "zls",
                    "superhtml",
                },
                handlers = {
                    default_lsp_handler,
                    clangd = clangd_lsp_handler,
                    csharp_ls = csharpls_lsp_handler,
                    arduino_language_server = arduino_lsp_handler,
                    lua_ls = luals_lsp_handler,
                    yamlls = yamlls_lsp_handler,
                    jsonls = jsonls_lsp_handler,
                    gopls = gopls_lsp_handler
                }
            })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        ft = {
            "cs",
            "csharp"
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {}
    }, --[[ Base Plugins ]] --
    {
        "EliSauder/nvim-lspconfig",
        dependencies = {
            "j-hui/fidget.nvim"
        },
        opt = {
            diagnostics = {
                underline = true,
                severity_sort = true
            },
            inlay_hints = {
                enabled = true
            }
        }
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({
                registries = {
                    "github:EliSauder/mason-registry"
                }
            })
        end
    }
}

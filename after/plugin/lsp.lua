local lsp = require('lsp-zero').preset({})

local on_attach_func = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",
        function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd",
        function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        opts)
    vim.keymap
        .set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        opts)
    vim.keymap.set("n", "<leader>qf", function()
        vim.lsp.buf.code_action({
            filter = function(a) return a.isPreferred end,
            apply = true
        })
    end, opts)
end

lsp.on_attach(on_attach_func);

lsp.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end
})

lsp.ensure_installed {
    'tsserver', 'eslint', 'rust_analyzer', 'lua_ls', 'bashls', 'clangd',
    'csharp_ls'
}

-- lsp specific configs
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {}
lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
        "-format-conf-path",
        require('lspconfig.util').root_pattern('.clang-format')(vim.fn.getcwd()) .. "/.clang-format"
    }
}
lspconfig.ghdl_ls.setup {}
lspconfig.kotlin_language_server.setup {}
lspconfig.bufls.setup {
    cmd = { vim.fn.expand("~/go/bin/bufls"), "serve" }
}
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.yamlls.setup {
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            }
        }
    }
}
lspconfig.csharp_ls.setup {
    handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            client.server_capabilities.documentFormattingProvider = false
        end
        if client.server_capabilities.documentRangeFormattingProvider then
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        on_attach_func(client, bufnr)
    end
}
lspconfig.clangd.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gh", ":ClangdSwitchSourceHeader<CR>", opts)

        on_attach_func(client, bufnr)
    end
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.setup()

require("mason-nvim-dap").setup({
    ensure_installed = {
        "cppdbg", "bash", "coreclr", "js", "codelldb", "clang-format"
    },
    handlers = {}
})

local null_ls = require("null-ls")
require('mason').setup()
require('mason-null-ls').setup({
    ensure_installed = { "lua_format", "commitlint", "clang-format" },
    automatic_installation = true,
    handlers = {}
})

null_ls.setup({ sources = {} })

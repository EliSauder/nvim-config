return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "FelipeLema/cmp-async-path",
            "hrsh7th/cmp-cmdline",
            "petertriho/cmp-git",
            "davidsierradz/cmp-conventionalcommits",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require('cmp').setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'async_path' },
                    { name = 'git' },
                    { name = 'conventionalcommits' },
                    { name = 'cmdline' },
                },
                sorting = {
                    comparators = {
                        require('cmp').config.compare.score
                    }
                }
            })
        end
    }
}

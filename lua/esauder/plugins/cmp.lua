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
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping({
                        i = function()
                            if cmp.visible() then
                                cmp.abort()
                            else
                                cmp.complete()
                            end
                        end,
                        c = function()
                            if cmp.visible() then
                                cmp.close()
                            else
                                cmp.complete()
                            end
                        end,
                    })
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'async_path' },
                    { name = 'git' },
                    { name = 'conventionalcommits' },
                    { name = 'cmdline' },
                }),
                formatting = {
                    format = require('lspkind').cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        show_labelDetails = true,
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            git = "[Git]",
                            async_path = "[Path]",
                            conventionalcommits = "[CC]",
                            cmdline = "[Cmd]"
                        })
                    }),
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.score
                    }
                }
            })
        end
    }
}

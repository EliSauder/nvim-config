return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                "nvim-dap-ui",
            },
            integrations = {
                lspconfig = true,
                cmp = true,
            },
        }
    },
    {
        "Bilal2453/luvit-meta", lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "EliSauder/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "FelipeLema/cmp-async-path",
            "hrsh7th/cmp-cmdline",
            "petertriho/cmp-git",
            "davidsierradz/cmp-conventionalcommits",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "lukas-reineke/cmp-under-comparator",
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local luasnip = require('luasnip')
            cmp.setup({
                performance = {
                    max_view_entries = 15
                },
                completion = {
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ['<C-n>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item(cmp_select)
                            elseif luasnip.jumpable(1) then
                                luasnip.jump(1)
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                    ['<C-p>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item(cmp_select)
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                    ['<C-y>'] = cmp.mapping(
                        function()
                            if cmp.visible() then
                                cmp.confirm({ select = true })
                                require('nvim-autopairs.completion.cmp').on_confirm_done()
                            elseif luasnip.expandable() then
                                luasnip.expand()
                            end
                        end, { "i", "s" }),
                    ['<C-Space>'] = cmp.mapping({
                        i = function()
                            if cmp.visible() then
                                cmp.abort()
                            else
                                cmp.complete()
                            end
                        end,
                    })
                },
                sources = cmp.config.sources({
                    { name = "lazydev",             group_index = 0 },
                    { name = "nvim_lsp",            priority = 8,   group_index = 1 },
                    { name = 'luasnip',             priority = 7,   group_index = 0 },
                    { name = 'buffer',              priority = 7 },
                    { name = 'async_path',          priority = 4 },
                    { name = 'git',                 priority = 4 },
                    { name = 'conventionalcommits', priority = 3 },
                    { name = 'cmdline',             priority = 2 },
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
                    priority_weight = 1.0,
                    comparators = {
                        cmp.config.compare.locality,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.score,
                        cmp.config.compare.offset,
                        cmp.config.compare.order,
                        --cmp.config.compare.exact,
                        require("cmp-under-comparator").under,
                        --cmp.config.compare.kind,
                    }
                }
            })
        end
    }
}

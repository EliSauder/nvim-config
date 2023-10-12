-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use({
        'nvim-treesitter/nvim-treesitter-context',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter'
    })
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter'
    })

    -- navigation
    use('theprimeagen/harpoon')
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake -- install build --prefix build',
        requires = {
            'nvim-telescope/telescope.nvim'
        }
    }
    use {
        'nvim-telescope/telescope-dap.nvim',
        requires = {
            'nvim-telescope/telescope.nvim'
        },
        after = 'nvim-dap'
    }

    -- Editing
    use('mbbill/undotree')
    use 'fedepujol/move.nvim'

    -- Git
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end
            }, { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            {
                'jose-elias-alvarez/null-ls.nvim',
                config = function() require('null-ls').setup() end,
                requires = { "nvim-lua/plenary.nvim" }
            }, { 'jayp0521/mason-null-ls.nvim' }, -- Autocompletion
            { 'hrsh7th/nvim-cmp' },               -- Required
            { 'hrsh7th/cmp-nvim-lsp' },           -- Required
            { 'L3MON4D3/LuaSnip' },               -- Required
            { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' }, { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' }, { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    }
    use 'mfussenegger/nvim-jdtls'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use({
        'jay-babu/mason-nvim-dap.nvim',
        requires = {
            'mfussengger/nvim-dap',
            'williamboman/mason.nvim',
        }
    })
    use({
        'theHamsta/nvim-dap-virtual-text',
        requires = {
            'mfussenegger/nvim-dap',
            'nvim-treesitter/nvim-treesitter'
        }
    })
    use({
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap'}
    })


    -- Utility
    use { 'm4xshen/autoclose.nvim' }
    use { 'Decodetalkers/csharpls-extended-lsp.nvim' }
    use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }

    -- visual
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    })
    use('lewis6991/gitsigns.nvim')
    use('marko-cerovac/material.nvim')
    use('folke/trouble.nvim')
    use('https://git.sr.ht/~whynothugo/lsp_lines.nvim')
    use({
        'utilyre/barbecue.nvim',
        tag = '*',
        requires = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        after = 'nvim-web-devicons',
    })
    use 'karb94/neoscroll.nvim'

    -- Training
    use('ThePrimeagen/vim-be-good')
end)

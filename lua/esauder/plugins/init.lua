return {
    {
        "nvim-lua/plenary.nvim",
        version = "*",
    },

    -- Git
    {
        "tpope/vim-fugitive",
        version = "*",
        event = "VeryLazy"
    },

    -- CSV
    {
        "cameron-wags/rainbow_csv.nvim",
        version = "*",
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    },

    -- Local config
    {
        "folke/neoconf.nvim",
        event = "VeryLazy",
        config = function()
            require("neoconf").setup()
        end
    }
}

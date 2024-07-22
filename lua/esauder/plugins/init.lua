return {
    {
        "nvim-lua/plenary.nvim",
    },

    -- Git
    {
        "tpope/vim-fugitive",
        event = "VeryLazy"
    },

    -- CSV
    {
        "cameron-wags/rainbow_csv.nvim",
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
        lazy = false,
        config = function()
            require("neoconf").setup()
        end
    }
}

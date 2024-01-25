return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },

    -- Git
    {
        "tpope/vim-fugitive",
        lazy = false,
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
    }
}

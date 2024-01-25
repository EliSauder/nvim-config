return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },

    -- Git
    {
        "tpope/vim-fugitive",
        lazy = false,
        config = function() 
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "fugitive",
                callback = function()
                    vim.api.nvim_buf_set_keymap(0, 'n', '.', 'k', { noremap = true, silent = true})
                end
            })
        end 
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

return {
    { 
        "nvim-treesitter/nvim-treesitter", 
        name = "treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "treesitter"
        }
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "treesitter"
        },
    },
}

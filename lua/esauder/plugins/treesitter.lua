return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        config = function(opts)
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "rust",
                    "bash",
                    "cmake",
                    "c_sharp",
                    "comment",
                    "cpp",
                    "dockerfile",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "json",
                    "json5",
                    "jsonc",
                    "make",
                    "regex",
                    "toml",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                }
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require('treesitter-context').setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },
}

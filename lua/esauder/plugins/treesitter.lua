return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "arduino",
                    "bash",
                    "c",
                    "c_sharp",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "csv",
                    "devicetree",
                    "dockerfile",
                    "doxygen",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "go",
                    "gomod",
                    "graphql",
                    "html",
                    "http",
                    "javascript",
                    "json",
                    "json5",
                    "jsonc",
                    "kotlin",
                    "latex",
                    "lua",
                    "luap",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "query",
                    "regex",
                    "rust",
                    "sql",
                    "ssh_config",
                    "swift",
                    "toml",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                    "zig"
                },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                indent = {
                    enable = true
                }
            })

            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require('treesitter-context').setup({
                enable = true,
                max_lines = 2,
                multiline_threashold = 2,
            })
            vim.cmd("hi TreesitterContextBottom gui=underline guisp=Grey")
            vim.cmd("hi TreesitterContextLineNumberBottom gui=underline guisp=Grey")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },
    {
        "apple/pkl-neovim",
        ft = "pkl",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        build = function()
            vim.cmd("TSInstall! pkl")
        end
    }
}

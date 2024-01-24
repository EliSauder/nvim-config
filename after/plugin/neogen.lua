require('neogen').setup {
    snippet_engine = "luasnip"
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dc", function() require('neogen').generate() end, opts)

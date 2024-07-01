--[[ LEADER CONFIGURATION ]]
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--[[ COLEMAK REMAPS ]]
-- remap chars that are being overwritten
vim.keymap.set("n", "<leader>/", "/")
vim.keymap.set("v", "<leader>/", "/")
vim.keymap.set("n", "<leader>m", "m")
vim.keymap.set("v", "<leader>m", "m")
vim.keymap.set("n", "<leader>.", ".")
vim.keymap.set("v", "<leader>.", ".")
vim.keymap.set("n", "<leader>,", ",")
vim.keymap.set("v", "<leader>,", ",")

vim.keymap.set("n", "<leader>?", "?")
vim.keymap.set("v", "<leader>?", "?")
vim.keymap.set("n", "<leader>M", "M")
vim.keymap.set("v", "<leader>M", "M")
vim.keymap.set("n", "<leader><", "<")
vim.keymap.set("v", "<leader>>", ">")
vim.keymap.set("n", "<leader><", "<")
vim.keymap.set("v", "<leader>>", ">")

-- map new movment keys
vim.keymap.set("n", "m", "h")
vim.keymap.set("v", "m", "h")
vim.keymap.set("n", ",", "j")
vim.keymap.set("v", ",", "j")
vim.keymap.set("n", ".", "k")
vim.keymap.set("v", ".", "k")
vim.keymap.set("n", "/", "l")
vim.keymap.set("v", "/", "l")

vim.keymap.set("n", "M", "H")
vim.keymap.set("v", "M", "H")
vim.keymap.set("n", "<", "J")
vim.keymap.set("v", "<", "J")
vim.keymap.set("n", ">", "K")
vim.keymap.set("v", ">", "K")
vim.keymap.set("n", "?", "L")
vim.keymap.set("v", "?", "L")

--[[ SELECTION MOVEMENT KEYMAPS ]]
-- Keymaps for moving selection
vim.keymap.set("n", "<", ":MoveLine(1)<CR>")
vim.keymap.set("n", ">", ":MoveLine(-1)<CR>")
vim.keymap.set("n", "M", ":MoveHChar(-1)<CR>")
vim.keymap.set("n", "?", ":MoveHChar(1)<CR>")
vim.keymap.set("n", "<A-m>", ":MoveWord(-1)<CR>")
vim.keymap.set("n", "<A-/>", ":MoveWord(1)<CR>")

vim.keymap.set("v", "<", ":MoveBlock(1)<CR>")
vim.keymap.set("v", ">", ":MoveBlock(-1)<CR>")
vim.keymap.set("v", "M", ":MoveHBlock(-1)<CR>")
vim.keymap.set("v", "?", ":MoveHBlock(1)<CR>")

-- Keeps the cursor in place when post pending
-- vim.keymap.set("n", "<", "mzJ`z")

-- Keep cursor in middle when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--[[ UTILITY KEYMAPS ]]
-- Keep current search in the center of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows you to paste without overwritting buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allows copying and pasting to the sys clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Replace word under cursor
vim.keymap.set("n", "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Project selection
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--[[ DEVELOPMENT KEYMAPS ]]
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "X", function() require("trouble").first({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<leader>X", function() require("trouble").last({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<C-.>", function() require("trouble").next({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<C-,>", function() require("trouble").previous({ skip_groups = true, jump = true }) end)
--vim.keymap.set("n", "<C-.>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>.", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>,", "<cmd>lprev<CR>zz")

----------------------------------------------
--[[              LSP KEYMAPS             ]]
----------------------------------------------
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('esauder', {}),
    desc = 'LSP Keymaps',
    callback = function(e)
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws",
            function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            opts)
        vim.keymap.set("n", "<leader>vrr", function() require("trouble").toggle("lsp_references") end, opts)
        --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        --    opts)
        vim.keymap
            .set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            opts)
        vim.keymap.set("n", "<leader>qf", function()
            vim.lsp.buf.code_action({
                filter = function(a) return a.isPreferred end,
                apply = true
            })
        end, opts)
        vim.keymap.set("n", "<leader>vd",
            function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        if client ~= nil and client.name == "clangd" then
            vim.keymap.set("n", "gh", ":ClangdSwitchSourceHeader<CR>", opts)
        end
    end
})

----------------------------------------------
--[[            PLUGIN KEYMAPS            ]]
----------------------------------------------

--[[ TELESCOPE ]]
vim.keymap.set('n', '<leader>pf',
    function()
        require('telescope.builtin').find_files()
    end, {})
vim.keymap.set('n', '<C-p>',
    function()
        require('telescope.builtin').git_files()
    end, {})
vim.keymap.set('n', '<leader>ps',
    function()
        require('telescope.builtin').live_grep()
    end, {})

--[[ HAPOON ]]
-- Marks
vim.keymap.set("n", "<leader>a",
    function()
        require("harpoon"):list():add()
    end, {})
vim.keymap.set("n", "<C-e>",
    function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, {})
-- UI Nav
vim.keymap.set("n", "<C-h>",
    function()
        require("harpoon"):list():select(1)
    end, {})
vim.keymap.set("n", "<C-t>",
    function()
        require("harpoon"):list():select(2)
    end, {})
vim.keymap.set("n", "<C-n>",
    function()
        require("harpoon"):list():select(3)
    end, {})
vim.keymap.set("n", "<C-s>",
    function()
        require("harpoon"):list():select(4)
    end, {})

--[[ UNDO TREE ]]
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--[[ NEOGEN ]]
vim.keymap.set("n", "<leader>dc",
    function()
        require('neogen').generate()
    end, { noremap = true, silent = true })

--[[ GIT FUGITIVE ]]
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '.', 'k', { noremap = true, silent = true })
    end
})

--[[ DAP ]]
vim.keymap.set('n', '<leader>dac', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dab',
    function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dasi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>daso', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>dasu', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>dast', function()
    require('dap').terminate()
    require('dap').close()
end)

require('neoscroll').setup({
    hide_cursor = false,
    post_hook = function(info)
        if info == "center" then
            vim.api.nvim_feedkeys("zz", "n", false)
        end
    end
})

local speed = '50'
local t     = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>']  = { 'scroll', { '-vim.wo.scroll', 'true', speed, 'quadradic', [['center']] } }
t['<C-d>']  = { 'scroll', { 'vim.wo.scroll', 'true', speed, 'quadradic', [['center']] } }
t['<C-b>']  = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', speed } }
t['<C-f>']  = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', speed } }
--t['<C-y>']  = { 'scroll', { '-0.10', 'false', speed } }
--t['<C-e>']  = { 'scroll', { '0.10', 'false', speed } }
t['zt']     = { 'zt', { speed } }
t['zz']     = { 'zz', { 0 } }
t['zb']     = { 'zb', { speed } }

require('neoscroll.config').set_mappings(t)

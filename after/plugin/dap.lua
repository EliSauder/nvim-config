vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>db',
    function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>dsu', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>dst', function()
    require('dap').terminate()
    require('dap').close()
end)

require('nvim-dap-virtual-text').setup()

require('dapui').setup()

vim.keymap.set('n', '<leader>duo', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>duc', function() require('dapui').close() end)
vim.keymap.set('n', '<leader>dut', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>due', function() require('dapui').eval() end)
vim.keymap.set('v', '<leader>due', function() require('dapui').eval() end)
vim.keymap.set('n', '<leader>dw',
    function() require('dapui').float_element("watches") end)

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

return {
    'mfussenegger/nvim-dap',
    dependencies = { 
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'jay-babu/mason-nvim-dap.nvim'
    },
    config = function()

        local harpoon = require('harpoon')

        harpoon:setup({
            settings = { save_on_toggle = true }
        })

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set('n', '<C-v>', function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-x>', function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-t>', function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })

            end,
        })

        vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
        vim.keymap.set('n', '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)


        vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
        vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
        vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
        vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)
        vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end)
        vim.keymap.set('n', '<leader>6', function() harpoon:list():select(6) end)
        vim.keymap.set('n', '<leader>7', function() harpoon:list():select(7) end)
        vim.keymap.set('n', '<leader>8', function() harpoon:list():select(8) end)
        vim.keymap.set('n', '<leader>9', function() harpoon:list():select(9) end)


        vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end)
        vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end)
    end
}

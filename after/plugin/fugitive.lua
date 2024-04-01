vim.keymap.set('n', '<leader>gs', function()
    vim.cnd.Git({ mods = { vertical = true } })
end)

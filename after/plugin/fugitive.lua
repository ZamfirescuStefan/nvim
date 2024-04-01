vim.keymap.set('n', '<leader>gs', function()
    vim.cmd.Git({ mods = { vertical = true } })
end)

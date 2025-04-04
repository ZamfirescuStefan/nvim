return {
    'AckslD/nvim-neoclip.lua',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        require('neoclip').setup()

        vim.keymap.set('n', '<C-y>', ":lua require('telescope').extensions.neoclip.default()<CR>")
        vim.keymap.set('i', '<C-y>', function()
                    vim.schedule(function()
                        require('telescope').extensions.neoclip.default()
                    end)
                end, { expr = false })
            end
}

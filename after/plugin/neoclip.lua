local neoclip = require('neoclip')
neoclip.setup()

vim.keymap.set('n', '<C-y>', ":lua require('telescope').extensions.neoclip.default()<CR>")
vim.keymap.set('i', '<C-y>', ":lua require('telescope').extensions.neoclip.default()<CR>")


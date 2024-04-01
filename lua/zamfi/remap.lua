vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')

vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', 'Q', '<nop>')

local opts  = {noremap = true, silent = true}

vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('n', '<leader>v', '\"_d')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')

-- Resize windows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +4<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -4<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize +4<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize -4<CR>', opts)

-- Copy file paths
vim.keymap.set('n', '<leader>cf', '<cmd>let @+ = expand(\"%\")<CR>', { desc = 'Copy File Name' })
vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand(\"%:p\")<CR>', { desc = 'Copy File Path' })

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

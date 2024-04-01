require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
}

vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', {})
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', {})


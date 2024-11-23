return {
    'ntpeters/vim-better-whitespace',
    config = function()
        vim.g.better_whitespace_guicolor='SteelBlue4'
        vim.keymap.set('n', '<leader>ts', ':StripWhitespace<CR>')
        -- vim.g.better_whitespace_ctermcolor = 'SlateGray'
    end
}

return {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.g.material_style = 'deep ocean'
        color = color or 'material'
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, "Cursor", { bg = "#6600ff" })
    end
}

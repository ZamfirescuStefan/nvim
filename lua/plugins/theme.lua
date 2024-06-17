return {
    'marko-cerovac/material.nvim',
    config = function ()
        vim.g.material_style = 'deep ocean'
        color = color or 'material'
        vim.cmd.colorscheme(color)
    end 
}

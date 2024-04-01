vim.g.material_style = 'deep ocean'

function ColorMyPencils(color)
    color = color or 'material'
    vim.cmd.colorscheme(color)

end

ColorMyPencils()

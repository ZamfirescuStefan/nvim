
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'marko-cerovac/material.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' }}
    }
    -- use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
    use {'nvim-treesitter/nvim-treesitter'}
    use 'nvim-lua/plenary.nvim'
    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'compat-07',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    }
    use {
        'AckslD/nvim-neoclip.lua',
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup()
        end
    }
    use 'lewis6991/gitsigns.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local plugins = {
    'marko-cerovac/material.nvim',

    {
        'nvim-telescope/telescope.nvim', version = '0.1.5',
        dependencies = { { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' }}
    },
    -- {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
    {'nvim-treesitter/nvim-treesitter'},
    'nvim-lua/plenary.nvim',
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'compat-07',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    {
        'AckslD/nvim-neoclip.lua',
    },
    {"akinsho/toggleterm.nvim", version = '*'},
    'lewis6991/gitsigns.nvim',

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
}

require("lazy").setup(plugins, {})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use ({'folke/tokyonight.nvim', 
    as = 'tokyonight',
    config = function()
        vim.cmd('colorscheme tokyonight')
    end
})
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}
use ('theprimeagen/harpoon')
use ('mbbill/undotree')
use ('nvim-treesitter/nvim-treesitter-context')
use ('folke/trouble.nvim')
use ('nvim-tree/nvim-web-devicons')
use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    }
}
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use "terrortylor/nvim-comment"
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
}
}
end)

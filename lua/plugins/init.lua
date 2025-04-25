local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print "Installing packer... Close and reopen Neovim after installation."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

local plugins = packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'windwp/nvim-autopairs'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  }
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
  }
  use {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  }
  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)

local function load_configs()
  require("plugins.configs.colorscheme")
  require("plugins.configs.nvim-tree")
  require("plugins.configs.lualine")
  require("plugins.configs.treesitter")
  require("plugins.configs.telescope")
  require("plugins.configs.lsp")
  require("plugins.configs.cmp")
  require("plugins.configs.autopairs")
  require("plugins.configs.gitsigns")
  require("plugins.configs.comment")
end

local config_status_ok, _ = pcall(load_configs)
if not config_status_ok then
  print("Some plugin configurations failed to load")
end

return plugins

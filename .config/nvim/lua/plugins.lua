local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

	-- Colorscheme
  use { 'andersevenrud/nordic.nvim', config = [[require('config.nordic')]] }

  use { 'kylechui/nvim-surround', config = [[require('nvim-surround').setup()]] }

  use { 'terrortylor/nvim-comment', config = [[require('nvim_comment').setup()]] }

  use { 'windwp/nvim-autopairs', config = [[require('config.autopairs')]] }

  use { 'junegunn/goyo.vim', cmd = 'Goyo' }

  use {
    {
      'folke/zen-mode.nvim',
      config = [[require('config.zen-mode')]],
      requires = { 'folke/twilight.nvim' },
    },
    {
      'folke/twilight.nvim',
      config = [[require('twilight').setup()]],
    },
  }

	-- Tree Sitter
	use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  }

	use 'RRethy/nvim-treesitter-endwise'

  use 'kyazdani42/nvim-web-devicons'

  -- LSP
  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }

  -- Telecope
  use {
    { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
        -- 'LinArcX/telescope-env.nvim',
      },
      cmd = 'Telescope',
      module = 'telescope',
      config = [[require('config.telescope')]],
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
    'crispgm/telescope-heading.nvim'
  }

  -- Snippets
  use {
    {
      'L3MON4D3/LuaSnip',
      config = [[require('config.luasnip')]]
    },
    'rafamadriz/friendly-snippets',
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind.nvim',
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[require('config.cmp')]],
    after = 'LuaSnip',
  }

  -- Diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('trouble').setup()]],
  }

	-- Language support
  use { 'ziglang/zig.vim', ft = 'zig' }

  use { 'stefanos82/nelua.vim', ft = 'nelua' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

local packer = require 'packer'
local util = require 'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  luarocks = {
    python_cmd = 'python3',
  }
})

-- Install LuaRocks integration
require 'packer.luarocks'.setup_paths(util.join_paths(vim.fn.stdpath('cache'), 'packer_hererocks', '2.1.0-beta3'))
require 'packer.luarocks'.install_commands()

return packer.startup(function(use)

  -----------------------------------------------------------------------------
  -- Meta
  -----------------------------------------------------------------------------
  --
  use_rocks 'stdlib'
  use_rocks 'luafilesystem'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Sensible defaults for Vim
  use 'tpope/vim-sensible'

  -- Integration with Tmux pane navigation
  use 'christoomey/vim-tmux-navigator'

  -- Used by lualine, trouble, others
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line
  use 'hoob3rt/lualine.nvim'

  -- Colorscheme
  use 'folke/tokyonight.nvim'

  -- Add keybinding helper
  use "folke/which-key.nvim"

  -- Add window closer
  use 'moll/vim-bbye'

  -----------------------------------------------------------------------------
  -- Text Editing plugins
  -----------------------------------------------------------------------------

  -- Easily manipulate parentheses, brackets, quotes, XML tags, and more
  use { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } }

  -- Handy bracket mappings
  use { 'tpope/vim-unimpaired', requires = { 'tpope/vim-repeat' } }

  -- Colorize hex/rgba/hsla codes
  use 'norcalli/nvim-colorizer.lua'

  -- TreeSitter integration
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Allow commenting current line, visual selection or motion
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = { 'b3nj5m1n/kommentary' } }

  -- EasyMotion-like movement
  -- use 'justinmk/vim-sneak'
  use { 'phaazon/hop.nvim', as = 'hop' }

  -- EnMasse
  use { 'Wolfy87/vim-enmasse' }

  -----------------------------------------------------------------------------
  -- Language & Syntax
  -----------------------------------------------------------------------------

  -- Elixir syntax
  use 'elixir-editors/vim-elixir'

  -- Markdown
  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install'](0) end }

  -- LaTex
  use { 'lervag/vimtex' }

  -- CoPilot
  use { 'github/copilot.vim' }

  -----------------------------------------------------------------------------
  -- IDE plugins
  -----------------------------------------------------------------------------
  -- Adds Unix file manipulation :Commands
  use 'tpope/vim-eunuch'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'j-hui/fidget.nvim'
  }

  -- Git support
  use 'tpope/vim-fugitive'

  -- Improved match with %
  use { 'andymass/vim-matchup', event = 'VimEnter' }

  -- Automatically close tags using TreeSitter
  use { 'windwp/nvim-ts-autotag' }

  -- File browsing
  use 'jeetsukumaran/vim-filebeagle'

  -- File picker
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Completion
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'ray-x/lsp_signature.nvim',
    'onsails/lspkind-nvim',
  }

  -- Snippets
  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
  }

  -- Diagnostics
  use "folke/trouble.nvim"

  -- Enable GitGutter like signs
  use 'lewis6991/gitsigns.nvim'

  -- DBA UI
  use {
    'tpope/vim-dadbod',
    requires = { 'kristijanhusak/vim-dadbod-ui' }
  }
end)

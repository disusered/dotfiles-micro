-- https://github.com/nvim-treesitter/nvim-treesitter

require 'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = 'maintained',

  -- List of parsers to ignore installing
  ignore_install = {},

  -- Enable TreeSitter highlight
  highlight = {
    enable = true,
    disable = {}
  },

  -- Enable TreeSitter indent
  indent = {
    enable = true
  },

  -- Enable TreeSitter integration with vim-matchup
  -- https://github.com/andymass/vim-matchup
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
  },

  -- Enable AutoTag
  -- https://github.com/windwp/nvim-ts-autotag
  autotag = {
    enable = true,
  },

  -- Configure kommentary with nvim-ts-context-commentstring
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#kommentary
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

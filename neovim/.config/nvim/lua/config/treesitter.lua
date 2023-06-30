-- https://github.com/nvim-treesitter/nvim-treesitter

require 'nvim-treesitter.configs'.setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter/issues/2293#issuecomment-1094250553
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'cmake',
    -- 'comment',
    'css',
    'dockerfile',
    'eex',
    'elixir',
    'heex',
    'go',
    'graphql',
    'hcl',
    -- 'help',
    'html',
    -- 'http',
    -- 'java',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'latex',
    'lua',
    'make',
    'php',
    'phpdoc',
    -- 'python',
    -- 'regex',
    'ruby',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
    'svelte',
  },

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
    disable = {}, -- optional, list of language that will be disabled
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
  }
}

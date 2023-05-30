-- Global variables
require('globals')

if vim.g.vscode then
  -- VSCode extension
  require('vscode.base')
else
  -- Basic Neovim configuration
  require('base')

  -- Defines plugins and Lua dependencies
  require('plugins')

  -- Configures the plugins by requiring config/*
  require("config.bbye")
  require("config.colorizer")
  require("config.filebeagle")
  require("config.fugitive")
  require("config.gitsigns")
  require("config.kommentary")
  require("config.lualine")
  require("config.telescope")
  require("config.tokyonight")
  require("config.treesitter")
  require("config.nvim-ts-autotag")
  require("config.whichkey")
  require("config.hop")
  require("config.trouble")
  require("config.indent")
  require("config.markdownpreview")
  require("config.dadbod")
  require("config.vimtex")
  require("config.vsnip")
  require("config.compe")
  require("config.nvim-lsp-kind")
  require("config.snippets")
  require("config.copilot")

  -- Useful keymaps
  require('maps')
end

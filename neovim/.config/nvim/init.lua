-- Global variables
require ('globals')

-- Basic Vim configuration
require ('base')

-- Defines plugins and Lua dependencies
require ('plugins')

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
require("config.lspconfig")
require("config.nvim-lsp-kind")
require("config.nvim-lsp-installer")
require("config.snippets")
require("config.copilot")
require("config.fidget")

-- Useful keymaps
require('maps')

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
require("config.lspconfig")
require("config.lualine")
require("config.snap")
require("config.tokyonight")
require("config.treesitter")
require("config.whichkey")
require("config.hop")
require("config.trouble")
require("config.indent")
require("config.compe")
require("config.markdownpreview")
require("config.snippets")
require("config.dadbod")
require("config.vimtex")
require("config.vsnip")

-- Useful keymaps
-- require('maps')

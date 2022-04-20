local lspkind = require('lspkind')
local cmp = require 'cmp'

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- default symbol map
      -- can be either 'default' or
      -- 'codicons' for codicon preset (requires vscode-codicons font installed)
      --
      -- default: 'default'
      preset = 'default',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = 'ƒ',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
      },
    })
  }
}

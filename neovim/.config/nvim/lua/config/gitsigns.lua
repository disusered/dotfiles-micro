local wk = require("which-key")

require('gitsigns').setup({
  -- Highlight line number
  numhl = true,

  -- Don't highlight actual line
  linehl = false,

  -- Customize signs
  signs = {
    add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
})

wk.register({
  ["<localleader>x"] = {
    g = { [[<cmd>Gitsigns setqflist<cr>]], 'Git changes', noremap = true, silent = true },
  }
})

-- https://github.com/hoob3rt/lualine.nvim

-- Enable and configure lualine
require('lualine').setup {
  options = {
    -- Enable theme - https://github.com/folke/tokyonight.nvim#-usage
    theme = 'tokyonight'
  },

  -- https://github.com/hoob3rt/lualine.nvim#extensions
  extensions = {'quickfix', 'fugitive'}
}

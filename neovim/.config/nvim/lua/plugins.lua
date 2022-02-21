local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  luarocks = {
    python_cmd = 'python3',
  }
})

-- Install LuaRocks integration
require'packer.luarocks'.setup_paths(util.join_paths(vim.fn.stdpath('cache'), 'packer_hererocks', '2.1.0-beta3'))
require'packer.luarocks'.install_commands()

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
end)

local wk = require("which-key")

wk.register({
  ["<leader>q"] = {':Bdelete<CR>', 'Delete the current buffer'}
})

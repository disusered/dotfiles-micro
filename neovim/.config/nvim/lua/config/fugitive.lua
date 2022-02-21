local wk = require("which-key")

-- Disable pty output
G('fugitive_pty', false)


-- Register keymaps with WhichKey
wk.register({
  ["<leader>g"] = {
    name = "Git",
    s = { ':Git<CR>', 'Git status (interactive)', noremap=true, silent = true },
    w = { ':Gwrite<CR>', 'Git write current file', noremap=true, silent = true },
    r = { ':Gread<CR>', 'Git read current file', noremap=true, silent = true },
    b = { ':Gblame<CR>', 'Git blame current file', noremap=true, silent = true },
    g = { ':Git ', 'Git command', noremap=true, silent = false },
  },
})

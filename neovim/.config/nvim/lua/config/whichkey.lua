-- Enable delay before which-key appears
vim.o.timeout = true

-- Delay before which-key appears after pressing a key
vim.o.timeoutlen = 300

require("which-key").setup {
  -- Shows WhichKey when pressing z= to select spelling suggestions
  spelling = {
    enabled = true,
    suggestions = 20,
  }
}

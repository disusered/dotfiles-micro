-- Initialize integration with null-ls
require("mason-null-ls").setup({
  ensure_installed = {
    "prettierd",
    "eslint_d",
  },
  automatic_installation = false,
  automatic_setup = true,
})

-- Initialize null-ls
require("null-ls").setup({
  sources = {
      -- Anything not supported by mason.
  }
})

-- Initialize the integration with null-ls
require 'mason-null-ls'.setup_handlers()

local null_ls = require("null-ls")

-- Initialize integration with null-ls
require("mason-null-ls").setup({
  ensure_installed = {
    "prettierd",
    "eslint_d",
  },
  automatic_installation = true,
  automatic_setup = true,
})

-- Initialize null-ls
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { "vue" },
    }),
    null_ls.builtins.formatting.eslint_d.with({
      extra_filetypes = { "vue" },
    })
  }
})

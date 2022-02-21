local filetypes = {
  vue = "prettier",
  html = "prettier",
  css = "prettier",
  scss = "prettier",
  javascript = "prettier",
  javascriptreact = "prettier",
  typescript = "prettierts",
  typescriptreact = "prettierts",
}

local formatters = {
  eslint = {command="eslint", args = { "--fix", "--stdin-filename", "%filepath"}},
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}},
  prettierts = {command = "prettier", args = {"--parser", "typescript", "--stdin-filepath", "%filepath"}}
}

-- Enable snippetSupport in capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.diagnosticls.setup{
  -- Attach capabilities to language server
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    -- Register keymaps
    require'config.lsp.maps'(client, bufnr)

    -- Attach LSP signature plugin and config
    require'config.lspsignature'()

    -- Attach LSP kind plugin and config
    require('lspkind').init({
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',
      -- options: 'default', 'codicons'
      preset = 'default'
    })
  end,

  filetypes = vim.tbl_keys(filetypes),

  init_options = {
    -- TODO: Add linter
    -- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
    formatters = formatters,
    formatFiletypes = filetypes
  }
}



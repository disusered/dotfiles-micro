require'lspconfig'.tsserver.setup{
  -- TSServer start command
  cmd = { "typescript-language-server", "--stdio" },

  -- Start on filetypes
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },

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

    -- Disable language server formatting
    client.resolved_capabilities.document_formatting = false
  end
}

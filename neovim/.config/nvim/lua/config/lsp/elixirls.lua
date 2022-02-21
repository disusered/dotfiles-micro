require'lspconfig'.elixirls.setup{
  -- $HOME and ~ are not expanded
  cmd = { vim.loop.os_homedir().."/.dotfiles/vendor/elixir-ls/release/language_server.sh" },

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
  end
}

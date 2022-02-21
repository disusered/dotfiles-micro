-- Enable snippetSupport in capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.texlab.setup {
    -- Start on filetypes
    filetypes = { "tex", "bib" },

    -- TexLab settings
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false, -- TODO: Enable forward search on LSP
          onSave = true -- TODO: Enable preview and update on LSP
        },
        -- TODO: Enable forward search on LSP
        forwardSearch = {
          -- executable = "nvr",
          -- args = '--remote-silent %f -c %l --servername /tmp/carlos/nvim0mywGo'
        },
        -- TODO: Add chktex dependency
        chktex = {
          onEdit = true,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    },

  -- Attach capabilities to CSS language server
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
  end
}

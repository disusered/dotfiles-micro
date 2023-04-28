-- Setup integration with LSP
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "vimls",
    "yamlls",
    "jedi_language_server",
    "pyright",
    "psalm",
    "intelephense",
    "phpactor",
    "svelte",
    "volar",
    "terraformls",
    "tflint",
  },
  automatic_installation = true,
})

-- An `on_attach` function that will be called for each server that attaches
local default_on_attach = function(client, bufnr)
  -- Register keymaps
  require 'config.nvim-lsp-maps' (client, bufnr)

  -- Attach LSP signature plugin and config
  require 'config.nvim-lsp-signature' ()
end

-- The default capabilities sent to the server
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The default config for all servers
local opts = {
  flags = { debounce_text_changes = 150 },
  on_attach = default_on_attach,
  capabilities = default_capabilities,
}

-- Setup LSP servers
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name)
    require("lspconfig")[server_name].setup(opts)
  end,

  -- Overrides for Lua server
  ["sumneko_lua"] = function ()
    opts.settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
    require'lspconfig'.sumneko_lua.setup(opts)
  end,
})

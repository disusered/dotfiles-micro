-- Setup integration with LSP
require("mason-lspconfig").setup({
  ensure_installed = {
    -- VimL
    "vimls",

    -- Bash
    "bashls",

    -- CSS
    "cssls",
    "tailwindcss",

    -- Docker
    "dockerls",

    -- HTML
    "html",

    -- JSON
    "jsonls",

    -- Elixir
    "elixirls",

    -- Lua
    "lua_ls",

    -- JavaScript/TypeScript
    "tsserver",
    "svelte",
    "volar",
    "vuels",

    -- YAML
    "yamlls",

    -- Python
    "jedi_language_server",
    "pyright",

    -- PHP
    -- "psalm",
    -- "intelephense",
    -- "phpactor",

    -- Terraform
    "terraformls",
    "tflint",

    -- C/C++
    "clangd",
  },
  automatic_installation = true,
})

-- An `on_attach` function that will be called for each server that attaches
local default_on_attach = function(client, bufnr)
  -- Register keymaps
  require 'config.nvim-lsp-maps' (client, bufnr)

  -- Attach LSP signature plugin and config
  require 'config.nvim-lsp-signature' ()

  -- Attach LSP context plugin
  if client.server_capabilities["documentSymbolProvider"] then
    require("nvim-navic").attach(client, bufnr)
  end
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
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,

  -- Overrides for Lua server
  ["lua_ls"] = function()
    local luals_opts = require "config.lsp-luals"
    opts = vim.tbl_deep_extend("force", luals_opts, opts)
    require 'lspconfig'.lua_ls.setup(opts)
  end,

  -- Overides for Tailwind
  ["tailwindcss"] = function()
    local tailwindcss_opts = require "config.lsp-tailwindcss"
    opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
    require 'lspconfig'.tailwindcss.setup(opts)
  end,
})

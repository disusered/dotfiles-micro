local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#overriding-the-default-lsp-server-options

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "cssls",
  "diagnosticls",
  "dockerls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "vimls",
  "vuels",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local function on_attach(client, bufnr)
  -- Register keymaps
  require'config.nvim-lsp-maps'(client, bufnr)

  -- Attach LSP signature plugin and config
  require'config.nvim-lsp-signature'()

    -- Attach LSP kind plugin and config
  require'config.nvim-lsp-kind'()
end

local enhance_server_opts = {
  -- Provide settings that should only apply to a particular server
}

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    on_attach = on_attach,
  }

  if enhance_server_opts[server.name] then
    -- Enhance the default opts with the server-specific ones
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
end)

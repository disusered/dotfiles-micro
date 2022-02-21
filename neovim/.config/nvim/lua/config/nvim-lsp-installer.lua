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

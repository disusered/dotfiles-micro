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
  -- Enable snippetSupport in capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Register keymaps
  require'config.nvim-lsp-maps'(client, bufnr)

  -- Attach LSP signature plugin and config
  require'config.nvim-lsp-signature'()

    -- Attach LSP kind plugin and config
  require'config.nvim-lsp-kind'()
end

local enhance_server_opts = {
  -- Provide settings that should only apply to a particular server
  -- Name comes from https://github.com/williamboman/nvim-lsp-installer#available-lsps
  ["vuels"] = function(opts)
    opts.init_options = {
      config = {
        -- Vetur options
        vetur = {
          -- Enable hover/definition/references in Vue interpolations
          -- WARNING: Requires JSDoc or TS annotations
          experimental = {
            templateInterpolationService = false
          },
          completion = {
            -- Include completion for module export and auto import them
            autoImport = true,
            -- Casing conversion for tag completion
            tagCasing = "kebab",
            -- Where Vetur sources scaffold snippets
            useScaffoldSnippets = true
          },
          -- Enable underline `.value` when using composition API.
          underline = {
            refValue = true
          },
          format = {
            -- Disable built-in document formatter
            enable = false,
          },
          -- Which built-in diagnostics to enable or disable. Disabling will
          -- fallback to ESLint, which is generally what we want in a project
          -- https://vuejs.github.io/vetur/guide/linting-error.html#linting
          validation = {
            template = true,
            script = true,
            style = true,
            templateProps = true,
            interpolation = true
          }
        }
      }
    }
  end,

  -- DiagnosticLS for Prettier
  ["diagnosticls"] = function(opts)
    local formatters = {
      eslint = {command="eslint", args = { "--fix", "--stdin-filename", "%filepath"}},
      prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}},
      prettierts = {command = "prettier", args = {"--parser", "typescript", "--stdin-filepath", "%filepath"}}
    }

    local filetypes = {
      vue = "prettier",
      html = "prettier",
      css = "prettier",
      scss = "prettier",
      javascript = "prettier",
      javascriptreact = "prettier",
      typescript = "prettier",
      typescriptreact = "prettier",
    }

    opts.filetypes = vim.tbl_keys(filetypes)

    opts.init_options =  {
      -- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
      formatters = formatters,
      formatFiletypes = filetypes
    }
  end,

  -- Lua LS options
  ["sumneko_lua"] = function(opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
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
  end
}

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    on_attach = on_attach,
  }

  -- Override the default options for a particular server
  local server_opts = enhance_server_opts[server.name]
  if server_opts then
    server_opts(opts)
  end


  server:setup(opts)
end)

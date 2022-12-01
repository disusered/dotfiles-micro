local enhance_server_opts = {
  -- DiagnosticLS for Prettier
  ["diagnosticls"] = function(opts)
    local formatters = {
      eslint = { command = "eslint", args = { "--fix", "--stdin-filename", "%filepath" } },
      prettier = { command = "prettier", args = { "--stdin-filepath", "%filepath" } },
      prettierts = { command = "prettier", args = { "--parser", "typescript", "--stdin-filepath", "%filepath" } },
      prettierphp = { command = "prettier", args = { "--plugin",  "@prettier/plugin-php", "--parser", "php", "--phpVersion", "7.4", "--tab-width", "2", "--stdin-filepath", "%filepath" } },
      terraformfmt = { command = "terraform", args = { "fmt", "--stdin-filepath", "%filepath" } }
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
      php = "prettierphp",
      terraform = "terraformfmt",
    }

    opts.filetypes = vim.tbl_keys(filetypes)

    opts.init_options = {
      -- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
      formatters = formatters,
      formatFiletypes = filetypes
    }
  end,

  ["eslint"] = function(opts)
    opts.on_attach = function(client, bufnr)
      -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      -- the resolved capabilities of the eslint server ourselves!
      client.server_capabilities.document_formatting = true
      on_attach(client, bufnr)
    end

    opts.settings = {
      format = { enable = true }, -- this will enable formatting
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

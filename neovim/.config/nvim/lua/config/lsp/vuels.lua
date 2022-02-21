local nvim_lsp = require('lspconfig')

require'lspconfig'.vuels.setup{
  -- Vue Language Server start command
  cmd = { vim.loop.os_homedir().."/.volta/bin/vls" },

  -- Start on filetypes
  filetypes = { "vue" },

  init_options = {
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
          -- Enable document formatter
          enable = false,
          -- Configure default code formatters for template blocks
          defaultFormatter = {
            css = "prettier",
            postcss = "prettier",
            sass = "sass-formatter",
            scss = "prettier",
            js = "prettier-eslint",
            ts = "prettier-eslint",
            html = "prettier"
          }
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
  },

  -- Define root Vue project directory pattern
  root_dir = nvim_lsp.util.root_pattern("package.json", "vue.config.js", "nuxt.config.js"),

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

      -- Internal Vetur formatting is not supported out of the box
      -- This line below is required if you:
        -- want to format using Nvim's native `vim.lsp.buf.formatting**()`
        -- want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
      -- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L558
    client.resolved_capabilities.document_formatting = false
  end
}


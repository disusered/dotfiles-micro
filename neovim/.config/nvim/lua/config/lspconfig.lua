vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

-- saga.init_lsp_saga {
--   -- Enable LSP diagnostic signs
--   use_saga_diagnostic_sign = true,

--   -- Configure diagnostic sign icons
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   definition_preview_icon = '  ',
--   finder_definition_icon = ' ',
--   finder_reference_icon = '☈ ',
--   dianostic_header_icon = '   ',
--   code_action_icon = ' ',

--   -- Enable and configure Code Actions
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 20,
--     virtual_text = true,
--   },

--   -- Key bindings for code actions
--   code_action_keys = {
--     quit = 'q',
--     exec = '<CR>'
--   },

--   -- Preview lines of lsp_finder and definition preview
--   max_preview_lines = 10,

--   -- Key bindings for file finder
--   finder_action_keys = {
--     open = '<Enter>', vsplit = 'v',split = 's',quit = 'q',scroll_down = '<C-d>', scroll_up = '<C-u>'
--   },

--   -- Prompt prefix for rename action
--   rename_prompt_prefix = '➤',

--   -- Key binding for rename
--   rename_action_keys = {
--     quit = '<C-c>',
--     exec = '<CR>'
--   },

--   -- UI border style, can be "single" "double" "round" "plus"
--   border_style = "single"
-- }

-- Enable Language Server configs
require('config.lsp.vuels')
require('config.lsp.html')
require('config.lsp.cssls')
require('config.lsp.tsserver')
require('config.lsp.elixirls')
require('config.lsp.luals')
require('config.lsp.bashls')
require('config.lsp.dockerls')
require('config.lsp.jsonls')
require('config.lsp.yamlls')
require('config.lsp.texlab')
require('config.lsp.terraformls')
require('config.lsp.diagnosticls')
require('config.lsp.tailwindcss')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local attach_keymaps = function(client, bufnr)
  local wk = require("which-key")

  -- https://github.com/neovim/nvim-lspconfig#Keybindings-and-completion
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Hover docs with K
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Next/prev diagnostic
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- Set format keybinds conditional on server capabilities
  local set_formatting = function()
    if client.resolved_capabilities.document_formatting then
        return { [[<cmd>lua vim.lsp.buf.formatting()<CR>]], 'Format', noremap=true, silent = true }
    elseif client.resolved_capabilities.document_range_formatting then
        return { [[<cmd>lua vim.lsp.buf.formatting()<CR>]], 'Format', noremap=true, silent = true }
    end
  end

  -- Normal mode
  wk.register({
    ["<localleader>"] = {
      name = "LSP",
      -- Rename variable
      r = { [[<cmd>lua vim.lsp.buf.rename()<CR>]], 'Rename', noremap=true, silent = true },
      -- Go to definition
      d = { [[<cmd>lua vim.lsp.buf.definition()<CR>]], 'Go to definition', noremap=true, silent = true },
      -- Go to declaration
      D = { [[<cmd>lua vim.lsp.buf.declaration()<CR>]], 'Go to declaration', noremap=true, silent = true },
      -- Open references in Quickfix
      R = { [[<cmd>lua vim.lsp.buf.references()<CR>]], 'Go to reference', noremap=true, silent = true },
      -- Go to implementation
      i = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Go to implementation', noremap=true, silent = true },
      -- Code Actions
      a = { [[<cmd>lua vim.lsp.buf.code_action()<CR>]], 'Code action', noremap=true, silent=true },
      -- Signature help
      s = { [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], 'Signature help', noremap=true, silent=true },
      -- Show line diagnostics
      g = { [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], 'Line diagnostics', noremap=true, silent=true },
      -- Format buffer
      p = set_formatting(),
      -- Trouble
      xx = { [[<cmd>TroubleToggle<cr>]], 'Toggle diagnostics', noremap=true, silent = true },
      xw = { [[<cmd>TroubleToggle lsp_workspace_diagnostics<cr>]], 'Workspace diagnostics', noremap=true, silent = true },
      xd = { [[<cmd>TroubleToggle lsp_document_diagnostics<cr>]], 'Document diagnostics', noremap=true, silent = true },
      xq = { [[<cmd>TroubleToggle quickfix<cr>]], 'Quickfix', noremap=true, silent = true },
      xl = { [[<cmd>TroubleToggle loclist<cr>]], 'Location list', noremap=true, silent = true }
    }
  })
end

return attach_keymaps

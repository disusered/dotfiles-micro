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
  local opts = { noremap = true, silent = true }

  -- Hover docs with K
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Next/prev diagnostic
  buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- Set format keybinds conditional on server capabilities
  -- TODO: Account for NullLS
  local set_formatting = function()
    -- if client.server_capabilities.documentFormattingProvider  then
      return { [[<cmd>lua vim.lsp.buf.format({ async = true })<CR>]], 'Format', noremap = true, silent = true }
    -- elseif client.server_capabilities.documentRangeFormattingProvider then
    --   return { [[<cmd>lua vim.lsp.buf.format({ async = true }})<CR>]], 'Format', noremap = true, silent = true }
    -- end
  end

  -- Normal mode
  wk.register({
    ["<localleader>"] = {
      name = "LSP",
      -- Rename variable
      r = { [[<cmd>lua vim.lsp.buf.rename()<CR>]], 'Rename', noremap = true, silent = true },
      -- Go to definition
      d = { [[<cmd>lua vim.lsp.buf.definition()<CR>]], 'Go to definition', noremap = true, silent = true },
      -- Go to declaration
      D = { [[<cmd>lua vim.lsp.buf.declaration()<CR>]], 'Go to declaration', noremap = true, silent = true },
      -- Open references in Quickfix
      R = { [[<cmd>lua vim.lsp.buf.references()<CR>]], 'Go to reference', noremap = true, silent = true },
      -- Go to implementation
      i = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Go to implementation', noremap = true, silent = true },
      -- Code Actions
      a = { [[<cmd>lua vim.lsp.buf.code_action()<CR>]], 'Code action', noremap = true, silent = true },
      -- Show line diagnostics
      g = { [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], 'Line diagnostics', noremap = true, silent = true },
      -- Hide LSP context bar
      b = { require("barbecue.ui").toggle, 'Toggle winbar', noremap = true, silent = true},
      -- Format buffer
      p = set_formatting(),
    }
  })

  -- Trouble
  wk.register({
    ["<localleader>x"] = {
      name = "Diagnostics",
      x = { [[<cmd>TroubleToggle<cr>]], 'Toggle diagnostics', noremap = true, silent = true },
      w = { [[<cmd>TroubleToggle workspace_diagnostics<cr>]], 'Workspace diagnostics', noremap = true, silent = true },
      d = { [[<cmd>TroubleToggle document_diagnostics<cr>]], 'Document diagnostics', noremap = true, silent = true },
      q = { [[<cmd>TroubleToggle quickfix<cr>]], 'Quickfix', noremap = true, silent = true },
      l = { [[<cmd>TroubleToggle loclist<cr>]], 'Location list', noremap = true, silent = true }
    }
  })
end

return attach_keymaps

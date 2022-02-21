local lsp_signature_init = function()
  -- Attach LSP signature plugin with custom config
  require "lsp_signature".on_attach({
    -- Required
    bind = true,

    -- Show hint in a floating window, set to false for virtual text only mode
    floating_window = true,

    -- Set to true, the floating window will not auto-close until finish all parameters
    fix_pos = true,

    -- Additional characters that trigger signature completion
    extra_trigger_chars = {"(", ","},

    -- Virtual hint disable
    hint_enable = false,

    -- Don't use LSPSaga popup
    use_lspsaga = false
  })
end

return lsp_signature_init

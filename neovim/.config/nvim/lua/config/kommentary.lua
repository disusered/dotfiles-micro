-- Add keymaps for kommentary
-- Map('n', '<Leader>/', '<Plug>kommentary_line_default', { noremap = false })
-- Map('v', '<Leader>/', '<Plug>kommentary_visual_default', { noremap = false })

-- require('kommentary.config').configure_language("default", {
--   prefer_single_line_comments = true,
--   use_consistent_indentation = true,
--   ignore_whitespace = true
-- })

-- local defaults = {
--   -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#kommentary
--   single_line_comment_string = 'auto',
--   multi_line_comment_strings = 'auto',
--   hook_function = function()
--     require('ts_context_commentstring.internal').update_commentstring()
--   end
-- }

-- local languages = {"javascript", "typescriptreact", "vue", "json", "lua", "html", "sh", "ruby", "php", "dockerfile", "tex", "elixir", "python", "scss"}

-- for _,language in ipairs(languages) do
--   require('kommentary.config').configure_language(language, defaults)
-- end


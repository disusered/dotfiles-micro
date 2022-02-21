-- Shortcut to set global
G = vim.api.nvim_set_var

-- Simplifies keymaps
-- @param mode - i, n, etc
-- @param lhs - Left-hand side of map
-- @param rhs - Right-hand side of map
-- @param opts - Options
function Map(mode, lhs, rhs, opts)
  -- Create default options
  local options = {noremap = true}

  -- Merge default options into user options
  if opts then options = vim.tbl_extend('force', options, opts) end

  if tonumber(options.buffer, 10) then
    -- Set buffer-specific keymaps if buffer option is a number
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
  else
    -- Else set regular keymap
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

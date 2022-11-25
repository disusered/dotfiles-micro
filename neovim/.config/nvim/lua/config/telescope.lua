local builtin = require('telescope.builtin')

vim.api.nvim_set_keymap('n', '<Leader>p', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
vim.keymap.set('n', '<Leader>r', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
vim.keymap.set('n', '!', builtin.grep_string, {})

require('telescope').setup {
  defaults = {
    layout_strategy = 'flex',
    vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number',
      '--column', '--smart-case' },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


-- TODO
-- Configure custom :Grep commands
local exports = {}

function exports.grep(args)
  return vimgrep { prompt = "Grep", filter = args } ()
end

vim.cmd("command! -nargs=* Grep :lua require('telescope.builtin').live_grep(<f-args>)")

return exports

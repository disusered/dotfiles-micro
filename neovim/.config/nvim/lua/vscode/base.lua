-- Use system clipboard as default depending on platform
vim.opt.clipboard = 'unnamedplus'

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})

-- Set leader to space
vim.g.mapleader = ' '

-- Set local leader to m
vim.g.maplocalleader = 'm'

-- Configure default tabstop
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Use smart case when searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Default to /g with %s/foo/bar
vim.o.gdefault = true

-- Pattern to ignore when expanding wildcards, file/dir, or globs
vim.o.wildignore = vim.o.wildignore .. '.git*,.hg*,.svn*,node_modules/**,'

-- Disable automatic backups
vim.o.backup = false
vim.o.writebackup = false

-- Disable swap file
vim.o.swapfile = false

-- Set spellfile
vim.o.spellfile = vim.loop.os_homedir() .. '/.dotfiles/vim/spellfile.utf-8.add'

-- Lower threshhold before CursorHold autocommand is run
vim.o.updatetime = 750

-- Add alias to common typos for closing and saving windows
vim.cmd(':command! WQ wq')
vim.cmd(':command! WQ wq')
vim.cmd(':command! Wq wq')
vim.cmd(':command! Wqa wqa')
vim.cmd(':command! W w')
vim.cmd(':command! Q q')

-- Change keymaps to make navigation easier i.e. the below, in Lua
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent=true})

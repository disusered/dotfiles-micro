-- Set Python3 host
if vim.fn.has('macunix') then
  vim.g.python_host_prog = '/usr/local/bin/python3'
else
  vim.g.python_host_prog = '/usr/bin/python3'
end

-- Set Node host from Volta
-- TODO: Fix in projects, maybe use system node
-- vim.g.node_host_prog = os.execute('volta which neovim-node-host')

-- Use system clipboard as default depending on platform
if vim.fn.has('macunix') then
  vim.g.clipboard_type = 'unnamed'
else
  vim.g.clipboard_type = 'unix'
end

-- Enable live search and replace
vim.o.inccommand = 'split'

-- Enable 24-bit RGB color in TUI (Darwin)
vim.o.termguicolors = true

-- Don't automatically set current directory to buffer path
vim.o.autochdir = false

-- Enable line numbers
vim.o.number = true

-- Enable hidden buffers
vim.o.hidden = true

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})

-- Set a minimum width for signcolumn
vim.o.signcolumn = 'yes:1'

-- Set leader to space
vim.g.mapleader = ' '

-- Set local leader to m
vim.g.maplocalleader = 'm'

-- Enable mouse mode
vim.o.mouse = 'a'

-- Set characters to distinguish tabs and spaces
vim.o.list = true
vim.o.listchars = 'trail:●,tab:⇥ᐧ,extends:▸,precedes:◂'

-- Show column at 80 characters
vim.o.colorcolumn = '80'

-- Configure default tabstop
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Don't wrap lines by default
vim.o.wrap = false

-- Configure line breaks
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = ' ...'

-- Allow panes to be fully collapsed
vim.o.winminheight = 0

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

-- Start diff with vertical splits
vim.o.diffopt = vim.o.diffopt .. ',vertical'

-- Lower threshhold before CursorHold autocommand is run
vim.o.updatetime = 750

-- Configure completion menu
vim.o.completeopt = "menuone,noselect"

-- Add alias to common typos for closing and saving windows
vim.cmd(':command! WQ wq')
vim.cmd(':command! WQ wq')
vim.cmd(':command! Wq wq')
vim.cmd(':command! Wqa wqa')
vim.cmd(':command! W w')
vim.cmd(':command! Q q')

local snap = require'snap'

local defaults = {
  consumer = "fzy",
  reverse = false,
  preview = true,
  suffix = " »",
  mappings = {
    ["enter-split"] = {"<C-s>"},
    ["next-item"] = {"<C-n>", "<Down>"},
    ["prev-item"] = {"<C-p>", "<Up>"},
  },
  args = {'--hidden', '--iglob', '!.git/*'},
  layout = snap.get('layout').bottom,
  limit = 50000
}

local file = snap.config.file:with(defaults)
local vimgrep = snap.config.vimgrep:with(defaults)


snap.maps {
  {"<Leader>p", file {producer = snap.get'consumer.fzy'(snap.get'producer.git.file'), prompt = "Git Files"}},
  {"<Leader>f", file {producer = "ripgrep.file", prompt = "Files"}},
  {"<Leader>b", file {producer = "vim.buffer", prompt = "Buffers"}},
  {"<Leader>o", file {producer = "vim.oldfile", prompt = "Recently Used"}},
  {"<Leader>r", vimgrep {prompt = "Grep"}},
  {"!", vimgrep {prompt = "Grep", filter_with = "cword"}}
}

-- Configure custom :Grep commands
local exports = {}

function exports.grep(args)
  return vimgrep {prompt = "Grep", filter = args}()
end

vim.cmd("command! -nargs=* Grep :lua require('config.snap').grep(<f-args>)")

return exports

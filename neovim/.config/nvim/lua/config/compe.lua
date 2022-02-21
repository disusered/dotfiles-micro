require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = false;
  };
}

-- Complete, expand or jump based on context
-- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
-- https://github.com/hrsh7th/vim-vsnip#2-setting

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  --[[ if vim.fn.pumvisible() == 1 then
    return vim.fn["compe#confirm"]() ]]
  if vim.fn.call("vsnip#available", {1}) == 1 then
    return t("<Plug>(vsnip-expand-or-jump)")
  else
    return t("<Tab>")
  end
end

-- Map Tab and S-Tab for expand and/or jump depending on context
Map("i", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})
Map("s", "<Tab>", "v:lua.tab_complete()", {noremap = false, expr = true})

Map("i", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { noremap = false, expr = true });
Map("s", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { noremap = false, expr = true });

-- Allow expansion of completions and snippets with Enter key
Map("i", "<CR>", [[compe#confirm("<CR>")]], {noremap = false, expr = true, silent = true})

-- Allow closing completion PUM with C-e
Map("i", "<C-e>", [[compe#close("<C-e>")]], {noremap = false, expr = true, silent = true})

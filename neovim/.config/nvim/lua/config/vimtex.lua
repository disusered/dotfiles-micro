vim.g.tex_flavor = 'latex'

vim.g.vimtex_quickfix_open_on_warning = 0

-- Let vimtex open skim, see :help vimtex_viewer_skim
vim.g.vimtex_view_automatic = 0

if vim.fn.has("mac") == 1 then
  -- https://skim-app.sourceforge.io/manual/SkimHelp_49.html
  vim.g.vimtex_view_method = "skim"
elseif vim.fn.has("unix") == 1 then
  vim.g.latex_view_general_viewer = "zathura"
  vim.g.vimtex_view_method = "zathura"
end

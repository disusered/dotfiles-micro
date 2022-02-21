vim.g.db_ui_use_nerd_fonts = 1

vim.g.db_ui_save_location = vim.loop.os_homedir().."/.dotfiles/neovim/db-scripts/"

vim.g.db_ui_table_helpers = {
  postgresql = {
    Count = 'select count(*) from {optional_schema}{table}',
  }
}

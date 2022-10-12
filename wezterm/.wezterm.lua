local wezterm = require 'wezterm'

return {
  font = wezterm.font('Source Code Pro'),
  font_size = 11.0,
  color_scheme = "Ocean (base16)",
  enable_tab_bar = false,
  enable_scroll_bar = false,
  colors = {
    -- The default text color
    foreground = '#a9b1d6',
    -- The default background color
    background = '#1a1b26',

    -- Colors used to highlight various text
    ansi = {
      '#414868',
      '#F7768E',
      '#73DACA',
      '#E0AF68',
      '#7AA2F7',
      '#BB9AF7',
      '#7DCFFF',
      '#c0caf5',
    }
  },
}

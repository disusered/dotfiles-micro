-- Initialize hop
require'hop'.setup {}

-- EasyMotion-like motion
Map('n', 's', [[<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = false })<cr>]], {noremap=false})

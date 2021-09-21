require('utils')

local M = {}

M.setup_onedark = function()
  cmd([[colorscheme onedark]])
end

M.setup_tokyonight = function()
  g.tokyonight_hide_inactive_statusline = true
  vim.g.tokyonight_style = "storm"

  cmd([[colorscheme tokyonight]])
end

return M
